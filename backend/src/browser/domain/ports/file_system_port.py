from abc import ABC, abstractmethod


class FileSystemPort(ABC):
    """
    Interface for Profile File System operations.
    Handles physical profile isolation between cold storage (cache) and execution
     (active).
    """

    @abstractmethod
    async def copy_to_active(self, account_id: str) -> None:
        """Copies an account's profile from cache to active directory."""
        pass

    @abstractmethod
    async def copy_to_cache(self, account_id: str) -> None:
        """Saves an account's profile state back to cache from active directory."""
        pass

    @abstractmethod
    async def ensure_directory(self, path: str) -> None:
        """Ensures that a directory exists, creating it if necessary."""
        pass
