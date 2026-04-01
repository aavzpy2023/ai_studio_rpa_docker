import re
from dataclasses import dataclass


@dataclass(frozen=True)
class UserPassword:
    """
    Value Object representing a plaintext user password.

    This is an immutable value object that enforces password complexity requirements.
    It validates that passwords meet security standards before they are hashed.

    Password Requirements:
        - At least one lowercase letter
        - At least one uppercase letter
        - At least one digit
        - At least one special character (non-alphanumeric)
        - Minimum length of 8 characters

    Attributes:
        value: The plaintext password string.

    Raises:
        ValueError: If the password doesn't meet complexity requirements.

    Note:
        This represents a plaintext password before hashing. For hashed passwords,
        use the HashedPassword value object instead.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the password complexity after initialization."""
        self._validate()

    def _validate(self) -> None:
        r"""
        Validate password complexity requirements using regex pattern matching.

        The password pattern enforces:
        - ^: Start of string
        - (?=.*[a-z]): At least one lowercase letter
        - (?=.*[A-Z]): At least one uppercase letter
        - (?=.*\d): At least one digit
        - (?=.*[\W_]): At least one special character (non-alphanumeric)
        - .{8,}: Minimum length of 8 characters
        - $: End of string

        Raises:
            ValueError: If the password doesn't match the required pattern.
        """
        # Define regex pattern for password validation
        pattern = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$"

        # Check if password matches the security requirements
        if not re.match(pattern, self.value):
            raise ValueError(
                "The password must contain lower and upper cases, numbers, "
                "special characters and at least 8 characters."
            )

    @classmethod
    def from_str(cls, value: str) -> "UserPassword":
        """
        Factory method to create  a UserPassword instance from a string.

        Args:
            value: The plaintext password string.

        Returns:
            A new UserPassword instance.

        Raises:
            ValueError: If the password doesn't meet complexity requirements.
        """
        return cls(value)
