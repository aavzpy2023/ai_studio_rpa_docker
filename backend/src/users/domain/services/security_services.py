from abc import ABC, abstractmethod
from typing import Any


class HashingService(ABC):
    """Abstract port for password hashing operations."""

    @abstractmethod
    def hash(self, plain_password: str) -> str:
        """Transform a plain text password into a secure hash."""
        pass

    @abstractmethod
    def verify(self, plain_password: str, hashed_password: str) -> bool:
        """Verify whether a plain text password matches a stored hash."""
        pass


class TokenService(ABC):
    """
    Abstract port for security token operations.
    """

    @abstractmethod
    def create_access_token(
        self, data: dict[str, Any], expires_delta_minutes: int = 60
    ) -> str:
        pass

    @abstractmethod
    def create_refresh_token(
        self, data: dict[str, Any], expires_delta_days: int = 7
    ) -> str:
        """Creates a long-lived token for session renewal."""
        pass

    @abstractmethod
    def decode_access_token(self, token: str) -> dict[str, Any]:
        """
        Verifies and decodes a token.
        Should raise an exception if token is invalid or expired.
        """
        pass
