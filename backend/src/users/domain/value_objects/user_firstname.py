from dataclasses import dataclass


@dataclass
class UserFirstName:
    """
    Value Object representing a user's first name.

    This value object enforces validation rules for first names including
    non-empty constraint and maximum length validation. The first name
    should be capitalized.

    Attributes:
        value: The first name  string (max 150 characters).

    Raises:
        ValueError: If the first name is empty or exceeds maximum length.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the first name after initialization."""
        self._validate()

    def _validate(self) -> str | None:
        """
        Validate first name constraints.

        Ensures the first name is not empty and doesn't exceed the maximum
        allowed length of 150 characters.

        Returns:
            The capitalized first name, or None.

        Raises:
            ValueError: If the first name is empty or too long.
        """
        field_len = 150  # Maximum allowed length for first name

        # Check if first name is empty
        if not self.value:
            raise ValueError("First name cannot be empty")
        # Check if first name exceeds maximum length
        elif len(self.value) > field_len:
            raise ValueError(f"First name cannot be longer than {field_len} characters")

        temp_value = self.value
        return temp_value.capitalize()

    @classmethod
    def from_str(cls, value: str) -> "UserFirstName":
        """
        Factory method to create a UserFirstName instance from a string.

        Args:
            value: The first name string.

        Returns:
            A new UserFirstName instance.

        Raises:
            ValueError: If validation fails.
        """
        return cls(value)
