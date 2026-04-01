"""
Domain Value Object for User Role.
Refactored to support Dynamic Roles (RBAC v2).
"""

import re
from dataclasses import dataclass


@dataclass(frozen=True)
class UserRole:
    """
    Value Object representing a User Role.
    Unlike v1, this is NOT an Enum, allowing dynamic role creation.
    """

    value: str

    # --- CONSTANTES DE SISTEMA (Legacy & Critical) ---
    # Se mantienen para uso interno del código (Seeders, Guards)
    ADMIN = "admin"
    VIEWER = "viewer"
    SALES_REP = "sales_rep"
    SALES_MANAGER = "sales_manager"
    BUYER = "buyer"
    PURCHASING_MANAGER = "purchasing_manager"
    INVENTORY_MANAGER = "inventory_manager"
    CUSTOMER_SUPPORT = "customer_support"
    DEVELOPER = "developer"

    def __post_init__(self) -> None:
        self._validate()

    def _validate(self) -> None:
        """
        Enforces naming conventions for roles.
        Rules:
        - Min 3 chars, Max 50.
        - Alphanumeric and underscores only (snake_case preferred).
        - No spaces.
        """
        if not self.value:
            raise ValueError("Role name cannot be empty.")

        role = self.value.strip()

        if len(role) < 3 or len(role) > 50:
            raise ValueError(f"Role '{role}' must be between 3 and 50 characters.")

        # Regex: Permite letras, números y guiones bajos.
        # Bloquea espacios, guiones medios o caracteres especiales.
        if not re.match(r"^[a-zA-Z][a-zA-Z0-9_]*$", role):
            raise ValueError(
                f"Role '{role}' is invalid. Must start with a letter and contain"
                f" only alphanumeric chars or underscores."
            )

        # Normalización forzada a lowercase (opcional, pero buena práctica)
        # Hack para frozen dataclass:
        object.__setattr__(self, "value", role.lower())

    @classmethod
    def from_string(cls, value: str) -> "UserRole":
        """Factory method for semantic instantiation."""
        return cls(value=value)

    def __str__(self) -> str:
        return self.value

    def __eq__(self, other: object) -> bool:
        if isinstance(other, UserRole):
            return self.value == other.value
        if isinstance(other, str):
            return self.value == other
        return False
