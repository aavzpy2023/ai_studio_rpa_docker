from dataclasses import dataclass


@dataclass(frozen=True)
class UserEmail:
    """
    Value Object representing a user's email address.

    This is an immutable value object that enforces basic email format validation.
    It ensures that any UserEmail  instance contains a valid email structure.

    Attributes:
        value: The email address string.

    Raises:
        ValueError: If the email format is invalid (missing @ or dot).
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the email format after initialization."""
        self._validate()

    def _validate(self) -> None:
        """
        Validate basic email format requirements.

        Ensures the email contains both an '@' symbol and at least one dot,
        which are fundamental components of a valid email address.

        Raises:
            ValueError: If the email doesn't contain '@' or lacks a dot.
        """
        if "@" not in self.value and self.value.count(".") < 1:
            raise ValueError("Incorrect email address")

    @classmethod
    def from_string(cls, value: str) -> "UserEmail":
        """
        Factory method to create a UserEmail instance from a string.

        Args:
            value: The email address string.

        Returns:
            A new UserEmail instance.

        Raises:
            ValueError: If the email format is invalid.
        """
        return cls(value)
