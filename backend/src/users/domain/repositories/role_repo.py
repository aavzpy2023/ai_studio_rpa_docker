from abc import ABC, abstractmethod

from users.domain.entities.permission import Permission
from users.domain.value_objects.user_role import UserRole


class RoleRepository(ABC):
    """
    Interface for Role Management.
    Decoupled from UserRepository to adhere to SRP.
    """

    @abstractmethod
    def save(self, role_name: UserRole, is_system: bool = False) -> None:
        """Persists a new role."""
        pass

    @abstractmethod
    def delete(self, role_name: UserRole) -> None:
        """Removes a role from the system."""
        pass

    @abstractmethod
    def exists(self, role_name: UserRole) -> bool:
        """Checks if a role identifier already exists."""
        pass

    @abstractmethod
    def get_system_status(self, role_name: UserRole) -> bool:
        """Returns True if the role is a protected system role."""
        pass

    @abstractmethod
    def get_role_permissions(self, role_name: UserRole) -> list[Permission]:
        """Retrieves permissions assigned to a specific role."""
        pass
