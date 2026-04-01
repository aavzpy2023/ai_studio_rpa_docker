import re
from dataclasses import dataclass


@dataclass
class UserName:
    """
    Value Object representing a user's username.

    This value object enforces validation rules for usernames including
    non-empty constraint and maximum length validation. The username
    is automatically converted to  lowercase for consistency.

    Attributes:
        value: The username string (max 50 characters, converted to lowercase).
    Raises:
        ValueError: If the username is empty or exceeds maximum length.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the username after initialization."""
        # force to lower case before validate in frozen=true objects
        object.__setattr__(self, "value", self.value.strip().lower())
        self._validate()

    def _validate(self) -> str | None:
        """
        Validate username constraints.

        Ensures the username is not empty and doesn't exceed the maximum
        allowed length of 50 characters. Usernames are normalized to lowercase.

        Returns:
            The lowercase username, or None.

        Raises:
            ValueError: If the username is empty or too long.
        """
        min_field_len = 3
        max_field_len = 50  # Maximum allowed length for username

        # Check if username is empty
        if not self.value:
            raise ValueError("Username cannot be empty")
        # Check if username exceeds maximum length
        elif len(self.value) > max_field_len or len(self.value) < min_field_len:
            raise ValueError(
                f"User name cannot be longer than {max_field_len}"
                f" or lower than {min_field_len} characters"
            )

        # Allow alphanumeric, underscore, dot, hyphen. No spaces or quotes.
        if not re.match(r"^[a-zA-Z0-9_.-]+$", self.value):
            raise ValueError("Username contains invalid characters")

        temp_value = self.value
        return temp_value.lower()  # Normalize to lowercase

    @classmethod
    def __from_str(cls, value: str) -> "UserName":
        """
        Factory method to create a UserName instance from a string.

        Note: This is a private method (name-mangled with double underscore).
        Consider making this public by renaming to 'from_str'.

        Args:
            value: The username string.

        Returns:
            A new UserName instance.

        Raises:
            ValueError: If validation fails.
        """
        return cls(value)
