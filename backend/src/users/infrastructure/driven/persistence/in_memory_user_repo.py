from typing import Any

from users.domain.entities.permission import Permission
from users.domain.entities.user import User
from users.domain.repositories.user_repo import UserRepository
from users.domain.value_objects.permission_name import PermissionName
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName


class InMemoryUserRepository(UserRepository):
    """
    In-memory implementation of the UserRepository.
    """

    def __init__(self) -> None:
        self._storage: dict[str, User] = {}

    def save(self, user: User) -> None:
        self._storage[user.id.value] = user
        print(f"[INFRA-MEM] User saved: {user.username.value} ({user.id.value})")

    def get_by_id(self, user_id: UserID) -> User | None:
        return self._storage.get(user_id.value)

    def get_by_email(self, email: UserEmail) -> User | None:
        return next(
            (
                user
                for user in self._storage.values()
                if user.email.value == email.value
            ),
            None,
        )

    def get_by_username(self, username: UserName) -> User | None:
        return next(
            (
                user
                for user in self._storage.values()
                if user.username.value == username.value
            ),
            None,
        )

    def get_all(self) -> list[User]:
        """Retrieve all users stored in memory."""
        # Retornamos simplemente la lista de valores del diccionario
        return list(self._storage.values())

    def update(self, user: User) -> None:
        """
        Update an existing user.
        In the in-memory context, this is identical to save (overwrite key).
        """
        self.save(user)

    def get_permissions(self, user_id: UserID) -> list[Permission]:
        user = self.get_by_id(user_id)
        if not user:
            return []

        # Mock permissions based on Role
        role_permissions_map = {
            UserRole.ADMIN: ["USERS_READ", "USERS_WRITE", "INVENTORY_WRITE"],
            UserRole.SALES_REP: ["SALES_READ", "SALES_WRITE", "INVENTORY_READ"],
            UserRole.VIEWER: ["SALES_READ", "INVENTORY_READ"],
            # Default fallbacks for new roles
            UserRole.SALES_MANAGER: ["SALES_READ", "SALES_WRITE", "USERS_READ"],
            UserRole.BUYER: ["INVENTORY_READ", "INVENTORY_WRITE"],
            UserRole.PURCHASING_MANAGER: [
                "INVENTORY_READ",
                "INVENTORY_WRITE",
                "USERS_READ",
            ],
            UserRole.INVENTORY_MANAGER: ["INVENTORY_READ", "INVENTORY_WRITE"],
            UserRole.CUSTOMER_SUPPORT: ["SALES_READ", "USERS_READ"],
        }

        perm_strings = role_permissions_map.get(user.role.value, [])

        domain_permissions = []
        for idx, p_name in enumerate(perm_strings, start=1):
            domain_permissions.append(
                Permission(
                    permission_id=idx,
                    name=PermissionName(p_name),
                    resource="mock_resource",
                    description="Mock description",
                )
            )

        return domain_permissions

    def delete_all(self) -> None:
        self._storage.clear()
        print("[INFRA-MEM] User storage cleared.")

    def get_all_roles(self) -> list[dict[str, Any]]:
        """Mock implementation for testing purposes."""
        return [
            {"id": 1, "name": "admin", "permissions": ["USERS_READ", "USERS_WRITE"]},
            {"id": 2, "name": "viewer", "permissions": ["USERS_READ"]},
        ]

    def get_all_permissions(self) -> list[Permission]:
        """Mock implementation for testing purposes."""
        return []

    def toggle_permission(self, role_id: int, perm_id: int) -> None:
        """Mock toggle logic for testing purposes."""
        pass

    def count_by_role(self, role: UserRole) -> int:
        return sum(1 for u in self._storage.values() if u.role == role)

    def sync_permissions(self, discovered_permissions: list[str]) -> tuple[int, int]:
        """Mock implementation for testing environments."""
        return 0, 0
