import asyncio
import shutil
from pathlib import Path

from browser.domain.ports.file_system_port import FileSystemPort


class FileSystemAdapter(FileSystemPort):
    """
    Implements atomic file system operations for Google Profiles.
    Wraps blocking physical I/O operations inside asyncio.to_thread
    to prevent event-loop freezing.
    """

    def __init__(self, base_path: str | None = None):
        import os

        if base_path is None:
            base_path = os.environ.get("PROFILES_DIR", "/data/profiles")
        self.base_path = Path(base_path)
        self.cache_dir = self.base_path / "cache"
        self.active_dir = self.base_path / "active"

        try:
            self.cache_dir.mkdir(parents=True, exist_ok=True)
            self.active_dir.mkdir(parents=True, exist_ok=True)
            test_file = self.active_dir / ".test_write"
            test_file.touch()
            test_file.unlink()
        except (PermissionError, OSError):
            print(
                f"[WARN] Cannot write to {self.base_path}. Falling back to /tmp/ai_profiles"
            )
            self.base_path = Path("/tmp/ai_profiles")
            self.cache_dir = self.base_path / "cache"
            self.active_dir = self.base_path / "active"
            self.cache_dir.mkdir(parents=True, exist_ok=True)
            self.active_dir.mkdir(parents=True, exist_ok=True)

    async def copy_to_active(self, account_id: str) -> None:
        cache_path = self.cache_dir / account_id
        active_path = self.active_dir / account_id

        def _copy() -> None:
            if active_path.exists():
                try:
                    shutil.rmtree(active_path)
                except Exception as e:
                    print(f"[WARN] Failed to remove active path {active_path}: {e}")
            if cache_path.exists():
                shutil.copytree(cache_path, active_path, dirs_exist_ok=True)
            else:
                active_path.mkdir(parents=True, exist_ok=True)

        await asyncio.to_thread(_copy)

    async def copy_to_cache(self, account_id: str) -> None:
        cache_path = self.cache_dir / account_id
        active_path = self.active_dir / account_id

        def _copy() -> None:
            if cache_path.exists():
                try:
                    shutil.rmtree(cache_path)
                except Exception as e:
                    print(f"[WARN] Failed to remove cache path {cache_path}: {e}")
            if active_path.exists():
                shutil.copytree(active_path, cache_path, dirs_exist_ok=True)

        await asyncio.to_thread(_copy)

    async def ensure_directory(self, path: str) -> None:
        def _mkdir() -> None:
            Path(path).mkdir(parents=True, exist_ok=True)

        await asyncio.to_thread(_mkdir)
