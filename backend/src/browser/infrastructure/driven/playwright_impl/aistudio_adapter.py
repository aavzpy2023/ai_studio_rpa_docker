import asyncio
import re
from typing import Any

from playwright.async_api import Page
from playwright.async_api import TimeoutError as PlaywrightTimeoutError

from browser.domain.exceptions import AccountAuthError, BrowserDomainError, DOMSelectorError
from browser.domain.ports.ai_studio_port import AIStudioPort
from browser.infrastructure.driven.playwright_impl.engine import PlaywrightEngine


class AIStudioAdapter(AIStudioPort):
    """
    Implements AIStudioPort.
    Interacts with the AI Studio DOM using the shared Playwright Engine.
    """

    def __init__(self, engine: PlaywrightEngine):
        self.engine = engine

    async def _dismiss_banners(self, page: Page) -> None:
        """Aggressively dismisses banners, tooltips, and Terms of Service modals."""

        async def try_click_tos() -> None:
            """Try to accept Terms of Service if a blocking modal is present."""
            try:
                tos_checkbox = page.locator('mat-checkbox:has-text("I agree"), mat-checkbox:has-text("terms")').first
                if await tos_checkbox.is_visible(timeout=1000):
                    await tos_checkbox.click(timeout=1000)
                    continue_btn = page.locator('button:has-text("Continue"), button:has-text("Accept")').first
                    if await continue_btn.is_visible(timeout=1000):
                        await continue_btn.click(timeout=1000)
            except Exception:
                pass

        async def try_click_btn(text: str) -> None:
            """Check visibility then click a button."""
            try:
                btn = page.locator(f"button:has-text('{text}')").first
                if await btn.is_visible(timeout=500):
                    await btn.click(timeout=1000)
            except Exception:
                pass

        # Run all dismissal tasks concurrently
        tasks = [try_click_tos()] + [try_click_btn(t) for t in ["Dismiss", "Got it", "Close", "No thanks"]]
        await asyncio.gather(*tasks)

    async def _dump_debug_state(self, page: Page, prefix: str = "error") -> None:
        """Genera un volcado del DOM y un screenshot en el contenedor Docker (/app/)."""
        try:
            await page.screenshot(path=f"/app/aistudio_{prefix}_state.png", full_page=True)
            content = await page.content()
            with open(f"/app/aistudio_{prefix}_dom_dump.html", "w", encoding="utf-8") as f:
                f.write(content)
            print(f"[DEBUG] Volcado guardado correctamente en: /app/aistudio_{prefix}_state.png")
        except Exception as e:
            print(f"[WARN] Fallo al generar volcado de depuración: {e}")

    async def _resilient_locate(
        self, page: Page, selectors: list[str], timeout: float = 2000.0
    ) -> Any:
        for attempt in range(3):
            for selector in selectors:
                try:
                    locator = page.locator(selector).first
                    await locator.wait_for(state="visible", timeout=timeout)
                    return locator
                except PlaywrightTimeoutError:
                    continue
            await asyncio.sleep(2**attempt)

        raise DOMSelectorError(
            f"Failed to locate element with provided selectors: {selectors}"
        )

    async def send_prompt(self, account_id: str, message: str) -> str:
        for attempt in range(2):
            try:
                context = await self.engine.ensure_context(account_id)

                for _ in range(10):
                    page = next((p for p in context.pages if "aistudio.google.com" in p.url), None)
                    if page:
                        break
                    await asyncio.sleep(0.5)

                if not page:
                    page = context.pages[-1] if context.pages else await context.new_page()

                await self._dismiss_banners(page)

                # Disable Grounding with Google Search if enabled
                try:
                    grounding_btn = page.locator('button[aria-label="Grounding with Google Search"][aria-checked="true"]').first
                    if await grounding_btn.is_visible(timeout=500):
                        await grounding_btn.click(timeout=1000)
                except Exception:
                    pass

                if "aistudio.google.com" not in page.url:
                    await page.goto(
                        "https://aistudio.google.com/app/prompts/new_chat",
                        wait_until="domcontentloaded",
                        timeout=60000.0,
                    )
                else:
                    await page.bring_to_front()

                await self._dismiss_banners(page)

                # Disable Grounding with Google Search if enabled
                try:
                    grounding_btn = page.locator('button[aria-label="Grounding with Google Search"][aria-checked="true"]').first
                    if await grounding_btn.is_visible(timeout=500):
                        await grounding_btn.click(timeout=1000)
                except Exception:
                    pass

                if "accounts.google.com" in page.url or await page.locator(
                    "a:has-text('Sign in')").is_visible(timeout=2000):
                    raise AccountAuthError("Google session expired. Manual VNC login required.")

                error_selectors = [
                    ".cdk-overlay-container >> text=Permission denied",
                    ".cdk-overlay-container >> text=An internal error",
                    "snack-bar-container >> text=An internal error",
                    "ms-toast >> text=Permission denied",
                ]
                has_error_banner = False
                for selector in error_selectors:
                    try:
                        if await page.locator(selector).first.is_visible(timeout=1000):
                            has_error_banner = True
                            break
                    except PlaywrightTimeoutError:
                        pass

                if has_error_banner:
                    if attempt == 0:
                        await page.reload(wait_until="domcontentloaded", timeout=60000.0)
                        continue
                    else:
                        raise BrowserDomainError("Critical overlay error banner detected")

                try:
                    textbox = page.locator('textarea[formcontrolname="promptText"]')
                    await textbox.wait_for(state="visible", timeout=5000)
                except PlaywrightTimeoutError:
                    raise DOMSelectorError("Could not locate textarea[formcontrolname=\"promptText\"]")

                turn_count = await page.locator('div[data-turn-role="Model"]').count()
                await textbox.focus()
                await textbox.fill(message)
                await textbox.press(" ")
                await textbox.press("Backspace")
                await page.wait_for_timeout(800)
                await textbox.focus()

                await page.keyboard.press("Control+Enter")

                try:
                    await page.wait_for_function(
                        f"() => document.querySelectorAll('div[data-turn-role=\"Model\"]').length > {turn_count}",
                        timeout=15000,
                    )
                except PlaywrightTimeoutError:
                    raise DOMSelectorError("Timeout: No new model turn detected.")

                last_turn = page.locator('div[data-turn-role="Model"]').last

                barrier = last_turn.locator('.model-run-time-pill, .model-error').first
                try:
                    await barrier.wait_for(state="attached", timeout=120000)
                except PlaywrightTimeoutError:
                    pass

                global_error_text = ""
                global_error = page.locator('ms-toast, .cdk-overlay-container snack-bar-container').last
                if await global_error.count() > 0 and await global_error.is_visible(timeout=1000):
                    error_text = await global_error.inner_text()
                    if error_text:
                        error_text = error_text.strip().replace("error", "", 1).replace("close", "", 1).strip()
                    global_error_text = error_text or ""

                error_locator = last_turn.locator('.model-error, ms-callout.error-callout').first
                if await error_locator.count() > 0:
                    turn_error_text = await error_locator.inner_text()
                    turn_error_text = (turn_error_text or "Internal model error").strip()
                    turn_error_text = turn_error_text.removeprefix("error").strip()
                    if global_error_text:
                        combined_error = f"{global_error_text} | {turn_error_text}"
                        combined_error = combined_error.strip(" |").strip()
                        raise BrowserDomainError(combined_error)
                    else:
                        raise BrowserDomainError(turn_error_text)

                if global_error_text:
                    raise BrowserDomainError(global_error_text)
                try:
                    final_response = await last_turn.locator('ms-cmark-node').last.inner_text(timeout=5000)
                except PlaywrightTimeoutError:
                    final_response = await last_turn.inner_text(timeout=5000)

                return final_response.strip()

            except Exception as e:
                print(f"[WARN] send_prompt attempt {attempt + 1} failed: {e}")
                error_str = str(e).lower()
                if attempt == 1 or "permission denied" in error_str:
                    raise BrowserDomainError(str(e))
                else:
                    try:
                        await page.reload(wait_until="domcontentloaded", timeout=60000.0)
                    except Exception:
                        pass

        raise BrowserDomainError("Failed to send prompt.")

    async def clear_chat(self, account_id: str) -> None:
        context = await self.engine.ensure_context(account_id)

        page = context.pages[0] if context.pages else await context.new_page()
        try:
            btn = page.locator('button[data-test-clear="outside"]').first
            await btn.click(timeout=5000)
            await page.wait_for_timeout(500)
        except Exception as e:
            print(f"[WARN] Failed to clear chat: {e}")
