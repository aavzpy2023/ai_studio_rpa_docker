import asyncio
import os
import subprocess

from playwright.async_api import (
    BrowserContext,
    Playwright,
    Route,
    async_playwright,
)

from browser.domain.exceptions import AccountAuthError
from browser.domain.ports.file_system_port import FileSystemPort


class PlaywrightEngine:
    """
    Stateful core for managing Playwright instances and contexts.
    Implements LRU and Anti-OOM limits by acting as the single source of truth.
    """

    def __init__(self, file_system: FileSystemPort, base_path: str | None = None):
        self.file_system = file_system
        self.contexts: dict[str, BrowserContext] = {}
        self.auth_browsers: dict[str, BrowserContext] = {}
        self.reaper_tasks: dict[str, asyncio.Task[None]] = {}
        self._playwright: Playwright | None = None

        if base_path is None:
            if hasattr(file_system, "base_path"):
                base_path = str(file_system.base_path)
            else:
                base_path = os.environ.get("PROFILES_DIR", "/data/profiles")

        self.active_dir = f"{base_path}/active"

    async def get_playwright(self) -> Playwright:
        """Singleton pattern for the Playwright engine instance."""
        if not self._playwright:
            playwright_mgr = async_playwright()
            self._playwright = await playwright_mgr.start()
        return self._playwright

    async def _abort_heavy_resources(self, route: Route) -> None:
        """
        Anti-OOM Interceptor:
        Aborts image and media requests to drastically reduce RAM usage.
        Explicitly allows font and stylesheet to prevent Angular streaming collapse.
        """
        try:
            if route.request.resource_type in ["image", "media"]:
                await route.abort()
            else:
                await route.continue_()
        except Exception:
            pass

    def cleanup_profile_locks(self, user_data_dir: str) -> None:
        """Removes Chromium lock files and orphans that prevent context launching after a crash."""
        subprocess.run(["pkill", "-9", "-f", f"--user-data-dir={user_data_dir}"],
            capture_output=True,
        )

        for lock in ["SingletonLock", "SingletonCookie", "SingletonSocket"]:
            path = os.path.join(user_data_dir, lock)
            if os.path.lexists(path):
                try:
                    os.unlink(path)
                except OSError:
                    pass

    async def activate_account(self, account_id: str) -> None:
        await self.file_system.copy_to_active(account_id)

        pw = await self.get_playwright()
        user_data_dir = f"{self.active_dir}/{account_id}"
        self.cleanup_profile_locks(user_data_dir)

        try:
            context = await pw.chromium.launch_persistent_context(
                user_data_dir=user_data_dir,
                headless=True,
                args=["--disable-dev-shm-usage", "--no-sandbox"],
            )
        except Exception as e:
            raise AccountAuthError(f"Failed to launch browser context: {e}") from e

        await context.route("**/*", self._abort_heavy_resources)
        self.contexts[account_id] = context

    async def deactivate_account(self, account_id: str) -> None:
        context = self.contexts.pop(account_id, None)
        if context:
            await context.close()

        await self.file_system.copy_to_cache(account_id)

    async def ensure_context(self, account_id: str) -> BrowserContext:
        """Lazily activates a browser context, respecting the 4-browser RAM limit (LRU)."""
        context = self.contexts.get(account_id)
        if context:
            # LRU: Move to end to mark as recently used
            self.contexts[account_id] = self.contexts.pop(account_id)
        else:
            # Anti-OOM: Evict oldest context if at capacity
            if len(self.contexts) >= 4:
                oldest_account = next(iter(self.contexts))
                await self.deactivate_account(oldest_account)
            await self.activate_account(account_id)
            context = self.contexts[account_id]
        return context