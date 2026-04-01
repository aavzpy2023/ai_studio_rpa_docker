"""Value object for permission identifiers.

This module defines the PermissionName value object, which encapsulates and
validates the unique string identifier for a system permission.
"""

import re
from dataclasses import dataclass


@dataclass(frozen=True)
class PermissionName:
    """Immutable value object representing a permission identifier.

    Enforces UPPER_SNAKE_CASE convention (e.g., 'USERS_READ', 'INVENTORY_WRITE').

    Attributes:
        value: The string representation of the permission name.
    """

    value: str

    def __post_init__(self) -> None:
        """Validate the permission name format after initialization."""
        self._validate()

    def _validate(self) -> None:
        """Ensure the name follows the strict system convention.

        Raises:
            ValueError: If empty or invalid format.
        """
        if not self.value:
            raise ValueError("Permission name cannot be empty")

        # Regex: Start with uppercase letter, followed by uppercase letters
        # or underscores
        # No spaces, numbers allowed if needed but convention usually avoids
        # them at start
        pattern = r"^[A-Z][A-Z0-9_]*$"

        if not re.match(pattern, self.value):
            raise ValueError(
                f"Invalid permission format: '{self.value}'. "
                "Must be UPPER_SNAKE_CASE (e.g., 'USERS_READ')."
            )

    @classmethod
    def from_string(cls, value: str) -> "PermissionName":
        """Factory method for creation."""
        return cls(value=value)
