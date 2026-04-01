from kink import inject

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.domain.exceptions import UserNotFoundError
from users.domain.value_objects.user_id import UserID
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)


@inject
class ToggleUserStatus:
    def __init__(self, uow: UnitOfWork):
        self.uow = uow

    def execute(self, user_id: str) -> bool:
        with self.uow:
            repo = PostgresUserRepository(self.uow.session)
            uid = UserID.from_string(user_id)
            user = repo.get_by_id(uid)

            if not user:
                raise UserNotFoundError(f"User {user_id} not found")

            user.toggle_active_status()
            repo.save(user)
            return True
