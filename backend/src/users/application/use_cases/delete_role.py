from kink import inject

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.domain.exceptions import UserDomainError
from users.domain.value_objects.user_role import UserRole
from users.infrastructure.driven.persistence.postgres_role_repo import (
    PostgresRoleRepository,
)
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)


@inject
class DeleteRole:
    """
    Use Case: Safely removes a role from the system.
    """

    def __init__(self, uow: UnitOfWork):
        self.uow = uow

    def execute(self, role_name: str) -> None:
        """
        Deletes a role if and only if:
        1. It is NOT a system role (e.g., 'admin', 'viewer').
        2. It has NO users assigned.
        """
        target_role = UserRole(role_name)

        with self.uow:
            # 1. Resolve Repositories within Transaction
            role_repo = PostgresRoleRepository(self.uow.session)
            user_repo = PostgresUserRepository(self.uow.session)

            # 2. Existence Check
            if not role_repo.exists(target_role):
                raise ValueError(f"Role '{role_name}' does not exist.")

            # 3. System Integrity Guard
            if role_repo.get_system_status(target_role):
                raise UserDomainError(
                    f"Cannot delete system role '{role_name}'. It is protected."
                )

            # 4. Referential Integrity Guard
            user_count = user_repo.count_by_role(target_role)
            if user_count > 0:
                raise UserDomainError(
                    f"Cannot delete role '{role_name}'. It is assigned to"
                    f" {user_count} user(s)."
                )

            # 5. Execution
            try:
                role_repo.delete(target_role)
            except Exception as e:
                if "violates foreign key constraint" in str(e).lower():
                    raise UserDomainError(
                        f"Cannot delete role '{role_name}'. It is assigned to active"
                        f" users."
                    ) from e
                raise
