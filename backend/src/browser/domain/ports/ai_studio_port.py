from abc import ABC, abstractmethod


class AIStudioPort(ABC):
    """
    Interface for interacting with Google AI Studio's DOM.
    Implementations must handle DOM scraping and user interaction resiliently.
    """

    @abstractmethod
    async def send_prompt(self, account_id: str, message: str) -> str:
        """
        Sends a prompt to the active AI Studio session and returns the text response.

        Args:
            account_id: The unique identifier of the active account session.
            message: The user's prompt text.

        Returns:
            The AI's generated response as a string.

        Raises:
            AccountAuthError: If the account context is not active.
            DOMSelectorError: If the UI changes and selectors fail to map elements.
        """
        pass

    @abstractmethod
    async def clear_chat(self, account_id: str) -> None:
        """
        Clears the current chat session in the active AI Studio profile.
        """
        pass
