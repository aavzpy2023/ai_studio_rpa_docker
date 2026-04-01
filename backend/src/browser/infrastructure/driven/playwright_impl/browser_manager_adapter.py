import asyncio
import os

from playwright.async_api import BrowserContext

from browser.domain.exceptions import AccountAuthError
from browser.domain.ports.browser_manager_port import BrowserManagerPort
from browser.domain.ports.file_system_port import FileSystemPort
from browser.infrastructure.driven.playwright_impl.engine import PlaywrightEngine
from browser.infrastructure.driven.playwright_impl.vnc_manager import VncManager


class BrowserManagerAdapter(BrowserManagerPort):
    """
    Implements BrowserManagerPort.
    Delegates complex state changes directly to the shared PlaywrightEngine.
    """

    def __init__(self, engine: PlaywrightEngine, file_system: FileSystemPort):
        self.engine = engine
        self.file_system = file_system
        self.vnc_manager = VncManager()

    async def activate_account(self, account_id: str) -> None:
        await self.engine.activate_account(account_id)

    async def deactivate_account(self, account_id: str) -> None:
        await self.engine.deactivate_account(account_id)

    async def _reaper_task(self, account_id: str, auth_context: BrowserContext) -> None:
        try:
            while True:
                await asyncio.sleep(1.0)
        except asyncio.CancelledError:
            pass
        except Exception:
            pass
        finally:
            await self._finalize_auth(account_id, auth_context)
            self.vnc_manager.cleanup_vnc_environment()

    async def start_manual_auth(self, account_id: str) -> str:
        self.vnc_manager.ensure_vnc_environment()

        user_data_dir = f"{self.engine.active_dir}/{account_id}"
        await self.file_system.ensure_directory(user_data_dir)
        self.engine.cleanup_profile_locks(user_data_dir)

        pw = await self.engine.get_playwright()

        try:
            env: dict[str, str | float | bool] = dict(os.environ)
            env["DISPLAY"] = ":99"

            context = await pw.chromium.launch_persistent_context(
                user_data_dir=user_data_dir,
                headless=False,
                ignore_default_args=["--enable-automation"],
                args=[
                    "--disable-dev-shm-usage",
                    "--no-sandbox",
                    "--disable-gpu",
                    "--disable-blink-features=AutomationControlled",
                ],
                env=env,
            )

            page = context.pages[0] if context.pages else await context.new_page()

            await page.add_init_script(
                "Object.defineProperty(navigator, 'webdriver', {get: () => undefined})"
            )

            async def _bg_navigate() -> None:
                try:
                    await page.goto(
                        "https://aistudio.google.com/app/prompts/new_chat",
                        wait_until="domcontentloaded",
                        timeout=15000,
                    )
                except Exception as e:
                    print(f"[WARN] VNC background goto error: {e}")

            asyncio.create_task(_bg_navigate())
            self.engine.auth_browsers[account_id] = context

        except Exception as e:
            print(f"[ERROR] Failed to launch Playwright inside VNC: {e}")
            raise AccountAuthError(f"Failed to launch auth browser: {e}") from e

        return f"VNC ready for {account_id} at port 5900/6080"

    async def _finalize_auth(self, account_id: str, context: BrowserContext) -> None:
        if account_id not in self.engine.auth_browsers:
            return

        try:
            session_file = f"{self.engine.active_dir}/{account_id}/auth_state.json"
            await context.storage_state(path=session_file)
        except Exception:
            pass
        try:
            await context.close()
        except Exception:
            pass
        self.engine.auth_browsers.pop(account_id, None)
        self.engine.reaper_tasks.pop(account_id, None)

    async def verify_and_save_auth(self, account_id: str) -> bool:
        context = self.engine.auth_browsers.get(account_id)
        if not context:
            print(f"[WARN] No active manual auth session found for {account_id}.")
            return False

        try:
            page = next(
                (p for p in context.pages if "aistudio.google.com" in p.url), None
            )
            if not page:
                page = context.pages[-1] if context.pages else await context.new_page()

            if "aistudio.google.com" not in page.url:
                await page.goto(
                    "https://aistudio.google.com/app/prompts/new_chat",
                    wait_until="domcontentloaded",
                    timeout=15000,
                )

            is_logged_out = "accounts.google.com" in page.url or "/app/" not in page.url

            is_authenticated = False
            if not is_logged_out:
                try:
                    await page.wait_for_selector("textarea", timeout=5000)
                    is_authenticated = True
                except Exception:
                    is_authenticated = False

            if is_authenticated:
                print(f"[INFO] Auth verified for {account_id}. Saving state...")
                session_file = f"{self.engine.active_dir}/{account_id}/auth_state.json"
                await context.storage_state(path=session_file)

                await self.abort_auth(account_id)
                await self.file_system.copy_to_cache(account_id)
                return True
            else:
                print(
                    f"[INFO] Auth not yet complete for {account_id}. Leaving VNC open."
                )
                return False

        except Exception as e:
            print(f"[ERROR] Failed to verify manual auth: {e}")
            return False

    async def abort_auth(self, account_id: str) -> None:
        browser = self.engine.auth_browsers.pop(account_id, None)
        task = self.engine.reaper_tasks.pop(account_id, None)
        if task:
            task.cancel()
        if browser:
            try:
                await browser.close()
            except Exception:
                pass

        self.vnc_manager.cleanup_vnc_environment()

    async def verify_session(self, account_id: str) -> bool:
        await self.file_system.copy_to_active(account_id)

        pw = await self.engine.get_playwright()
        user_data_dir = f"{self.engine.active_dir}/{account_id}"
        self.engine.cleanup_profile_locks(user_data_dir)

        try:
            context = await pw.chromium.launch_persistent_context(
                user_data_dir=user_data_dir,
                headless=True,
                args=["--disable-dev-shm-usage", "--no-sandbox"],
            )
        except Exception:
            return False

        try:
            page = context.pages[0] if context.pages else await context.new_page()
            await page.goto(
                "https://aistudio.google.com/app/prompts/new_chat",
                wait_until="domcontentloaded",
            )

            await page.wait_for_timeout(3000)

            is_logged_out = "accounts.google.com" in page.url or "/app/" not in page.url
            if is_logged_out:
                return False

            try:
                await page.wait_for_selector("textarea", timeout=5000)
                return True
            except Exception:
                return False
        finally:
            await context.close()