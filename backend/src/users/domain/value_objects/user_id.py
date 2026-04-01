from dataclasses import dataclass


@dataclass(frozen=True)
class UserID:
    """
    Value Object representing a unique user identifier.

    This is an immutable value object that represents a UUID-based user identifier.
    It enforces that the ID is exactly 36 characters long, which is the standard
    length for UUID strings (including hyphens).

    Attributes:
        value: The user ID string (must be exactly 36 characters, typically a UUID).

    Raises:
        ValueError: If the  ID is not exactly 36 characters long.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the user ID after initialization."""
        self._validate()

    def _validate(self) -> None:
        """
        Validate that the user ID has the correct format.

        Ensures the ID is not empty and is exactly 36 characters long,
        which corresponds to the standard UUID format
        (e.g., '550e8400-e29b-41d4-a716-446655440000').

        Raises:
            ValueError: If the ID is empty or not 36 characters long.
        """
        if not self.value:
            raise ValueError("UserID cannot be empty")

    @classmethod
    def from_string(cls, value: str) -> "UserID":
        """
        Factory method to create a UserID instance from a string.

        Args:
            value: The user ID string (typically a UUID).

        Returns:
            A new UserID instance.

        Raises:
            ValueError: If the ID format is invalid.
        """
        return cls(value=value)

    @classmethod
    def from_int(cls, value: int) -> "UserID":
        return cls(value=str(value))
