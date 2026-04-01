from abc import ABC, abstractmethod
from typing import Any

from users.domain.entities.permission import Permission
from users.domain.entities.user import User
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName


class UserRepository(ABC):
    """
    Repository Interface for User Aggregate.

    This abstract base class defines the contract for user persistence operations
    following the Repository pattern from Domain-Driven Design (DDD). Concrete
    implementations should handle the actual persistence mechanism (e.g., database,
    in-memory storage, etc.).

    The repository acts as an in-memory collection abstraction, hiding the details
    of data access and providing a domain-oriented interface for user retrieval
    and persistence operations.
    """

    @abstractmethod
    def save(self, user: User) -> None:
        """
        Persist a user entity to the underlying storage.

        This method handles both creating new users and updating existing ones.
        The implementation should determine whether to perform an insert or update
        based on the user's state.

        Args:
            user: The User entity to save.

        Raises:
            Exception: Implementation-specific exceptions for persistence failures.
        """
        pass

    @abstractmethod
    def get_by_id(self, user_id: UserID) -> User | None:
        """
        Retrieve a user by their unique identifier.

        Args:
            user_id: The unique identifier of the user to retrieve.

        Returns:
            The User entity if found, None otherwise.

        Raises:
            Exception: Implementation-specific exceptions for retrieval failures.
        """
        pass

    @abstractmethod
    def get_by_email(self, email: UserEmail) -> User | None:
        """
        Retrieve a user by their email address.

        This method is primarily used for authentication flows and duplicate
        email validation during user registration. Email lookups should be
        case-insensitive in the implementation.

        Args:
            email: The email address to search for.

        Returns:
            The User entity if found, None otherwise.

        Raises:
            Exception: Implementation-specific exceptions for retrieval failures.
        """
        pass

    @abstractmethod
    def get_by_username(self, username: UserName) -> User | None:
        """
        Retrieve a user by their username.

        This method is used for username uniqueness validation and user lookups.
        Username searches should typically be case-insensitive in the implementation.

        Args:
            username: The username to search for.

        Returns:
            The User entity if found, None otherwise.

        Raises:
            Exception: Implementation-specific exceptions for retrieval failures.
        """
        pass

    @abstractmethod
    def get_permissions(self, user_id: UserID) -> list[Permission]:
        """
        Retrieve all permissions associated with the user's role.

        Args:
            user_id: The unique identifier of the user.

        Returns:
            A list of Permission domain entities.
        """
        pass

    @abstractmethod
    def get_all(self) -> list[User]:
        """Retrieve all registered users."""
        pass

    @abstractmethod
    def update(self, user: User) -> None:
        """Persist changes to an existing user."""
        pass

    @abstractmethod
    def get_all_roles(self) -> list[dict[str, Any]]:
        """Retrieves all roles with their assigned permission names."""
        pass

    @abstractmethod
    def get_all_permissions(self) -> list[Permission]:
        """Retrieves the complete catalog of system permissions."""
        pass

    @abstractmethod
    def toggle_permission(self, role_id: int, perm_id: int) -> None:
        """Adds or removes a permission from a role (XOR logic)."""
        pass

    @abstractmethod
    def count_by_role(self, role: UserRole) -> int:
        """Returns the number of users assigned to a specific role."""
        pass

    @abstractmethod
    def sync_permissions(self, discovered_permissions: list[str]) -> tuple[int, int]:
        """
        Synchronizes code-defined permissions with the database.
        """
        pass
