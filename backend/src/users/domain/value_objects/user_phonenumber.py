import re
from dataclasses import dataclass


@dataclass(frozen=True)
class UserPhoneNumber:
    """
    Value Object representing a user's phone number.

    This is an immutable value object that enforces phone number format validation.
    It ensures the phone number  contains exactly 11 digits without any formatting
    characters (no spaces, dashes, or parentheses).

    Attributes:
        value: The phone number string (must be exactly 11 digits).

    Raises:
        ValueError: If the phone number is not exactly 11 digits.

    Example:
        Valid: "12345678901"
        Invalid: "123-456-7890", "123 456 7890", "(123) 456-7890"
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the phone number format after initialization."""
        self._validate()

    def _validate(self) -> None:
        r"""
        Validate phone number format requirements.

        The phone number pattern enforces:
        - ^: Start of string
        - \d{11}: Exactly 11 consecutive digits
        - $: End of string

        Raises:
            ValueError: If the phone number is not exactly 11 digits.
        """
        # Define regex pattern for phone number validation
        pattern = r"^\d{11}$"

        # Check if phone number matches the required format
        if not re.match(pattern, self.value):
            raise ValueError("Phone number must contain only 11 digits.")

    @classmethod
    def from_str(cls, value: str) -> "UserPhoneNumber":
        """
        Factory method to create a UserPhoneNumber instance from a string.

        Args:
            value: The phone number string (must be 11 digits).

        Returns:
            A new UserPhoneNumber instance.

        Raises:
            ValueError: If the phone number format is invalid.
        """
        return cls(value)
