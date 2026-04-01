from dataclasses import dataclass


@dataclass
class UserLastName:
    """
    Value Object representing a user's last name.

    This value object enforces validation rules for last names including
    non-empty constraint and maximum length validation. The last name
    should be capitalized.

    Attributes:
        value: The last name string (max 150 characters).

    Raises:
        ValueError: If the last  name is empty or exceeds maximum length.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the last name after initialization."""
        self._validate()

    def _validate(self) -> str | None:
        """
        Validate last name constraints.

        Ensures the last name is not empty and doesn't exceed the maximum
        allowed length of 150 characters.

        Returns:
            The capitalized last name, or None.

        Raises:
            ValueError: If the last name is empty or too long.
        """
        field_len = 150  # Maximum allowed length for last name

        # Check if last name is empty
        if not self.value:
            raise ValueError("Last name cannot be empty")
        # Check if last name exceeds maximum length
        elif len(self.value) > field_len:
            raise ValueError(f"Lastname cannot be longer than {field_len} characters")

        temp_value = self.value
        return temp_value.capitalize()

    @classmethod
    def from_str(cls, value: str) -> "UserLastName":
        """
        Factory method to create a UserLastName instance from a string.

        Args:
            value: The last name string.

        Returns:
            A new UserLastName instance.

        Raises:
            ValueError: If validation fails.
        """
        return cls(value)
