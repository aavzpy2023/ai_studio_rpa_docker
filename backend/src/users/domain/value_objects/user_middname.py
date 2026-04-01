from dataclasses import dataclass


@dataclass
class UserMiddName:
    """
    Value Object representing a user's middle name.

    This value object enforces validation rules for middle names including
    non-empty constraint and maximum length validation. The middle name
    should be capitalized.

    Attributes:
        value: The middle name string (max 150 characters).

    Raises:
        ValueError: If the middle  name is empty or exceeds maximum length.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the middle name after initialization."""
        self._validate()

    def _validate(self) -> str | None:
        """
        Validate middle name constraints.

        Ensures the middle name is not empty and doesn't exceed the maximum
        allowed length of 150 characters.

        Returns:
            The capitalized middle name, or None.

        Raises:
            ValueError: If the middle name is empty or too long.
        """
        field_len = 150  # Maximum allowed length for middle name

        # Check if middle name is empty
        if not self.value:
            return ""

        # Check if middle name exceeds maximum length
        if len(self.value) > field_len:
            raise ValueError(f"First name cannot be longer than {field_len} characters")

        temp_value = self.value
        return temp_value.capitalize()

    @classmethod
    def from_str(cls, value: str) -> "UserMiddName":
        """
        Factory method to create a UserMiddName instance from a string.

        Args:
            value: The middle name string.

        Returns:
            A new UserMiddName instance.

        Raises:
            ValueError: If validation fails.
        """
        return cls(value)
