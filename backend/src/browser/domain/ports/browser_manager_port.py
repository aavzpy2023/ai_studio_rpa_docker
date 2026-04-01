from abc import ABC, abstractmethod


class BrowserManagerPort(ABC):
    """
    Interface for orchestrating headless browser sessions.
    """

    @abstractmethod
    async def activate_account(self, account_id: str) -> None:
        """
        Prepares and launches a headless browser context for the given account.
        """
        pass

    @abstractmethod
    async def deactivate_account(self, account_id: str) -> None:
        """
        Gracefully terminates the browser context and persists its state.
        """
        pass

    @abstractmethod
    async def verify_session(self, account_id: str) -> bool:
        """
        Opens profile in headless mode, navigates to AI Studio,
        and checks if redirect to accounts.google.com occurs.
        """
        pass

    @abstractmethod
    async def start_manual_auth(self, account_id: str) -> str:
        """
        Launches a visible browser for manual authentication and returns the session file path.
        """
        pass

    @abstractmethod
    async def verify_and_save_auth(self, account_id: str) -> bool:
        """
        Verifies session in headless mode, saves storage_state, and returns True if verified.
        """
        pass

    @abstractmethod
    async def abort_auth(self, account_id: str) -> None:
        """
        Aborts any pending manual authentication process and cleans up resources.
        """
        pass
