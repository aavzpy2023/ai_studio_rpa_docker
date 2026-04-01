from kink import inject

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.domain.exceptions import UserNotFoundError
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_role import UserRole
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)


@inject
class UpdateUserRole:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow

    def execute(self, user_id: str, new_role_str: str) -> None:
        with self.uow:
            repo = PostgresUserRepository(self.uow.session)
            uid = UserID.from_string(user_id)
            new_role = UserRole.from_string(new_role_str)

            user = repo.get_by_id(uid)
            if not user:
                raise UserNotFoundError(f"User with ID {user_id} not found.")

            # Internal status change
            user._role = new_role
            user.change_updated_at()

            repo.update(user)
