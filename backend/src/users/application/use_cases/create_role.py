from kink import inject

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.domain.exceptions import DuplicateUserError
from users.domain.value_objects.user_role import UserRole
from users.infrastructure.driven.persistence.postgres_role_repo import (
    PostgresRoleRepository,
)


@inject
class CreateRole:
    """
    Use Case: Defines a new security role in the system.
    """

    def __init__(self, uow: UnitOfWork):
        self.uow = uow

    def execute(self, role_name: str) -> None:
        """
        Creates a custom role.
        Invariants:
        1. Role name must be valid (UserRole VO).
        2. Role must not already exist.
        3. Custom roles are always is_system=False.
        """
        # 1. Validate Format (VO raises ValueError if invalid)
        role_vo = UserRole(role_name)

        with self.uow:
            repo = PostgresRoleRepository(self.uow.session)

            # 2. Check Duplicity
            if repo.exists(role_vo):
                raise DuplicateUserError(f"Role '{role_name}' already exists.")

            # 3. Persist
            repo.save(role_vo, is_system=False)
