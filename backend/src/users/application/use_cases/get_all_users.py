"""Use case for retrieving all users.

This module implements the logic to fetch a directory of all registered users,
typically for administrative views.
"""

from kink import inject

from users.application.dtos import UserResponse
from users.domain.repositories.user_repo import UserRepository


@inject
class GetAllUsers:
    """Orchestrator for fetching the full user registry."""

    def __init__(self, repository: UserRepository):
        self.repository = repository

    def execute(self) -> list[UserResponse]:
        """
        Retrieve all users and map them to safe response objects.

        Returns:
            List of UserResponse DTOs.
        """
        users = self.repository.get_all()

        # Mapping Domain Entities -> Response DTOs
        return [
            UserResponse(
                id=user.id.value,
                username=user.username.value,
                email=user.email.value,
                firstname=user.firstname.value,
                lastname=user.lastname.value,
                role=user.role.value,
                created_at=user.created_at.isoformat(),
                permissions=[],
                active=user.is_active,
                phone=user.phone_number.value,
                middname=user.middname.value if user.middname else None,
            )
            for user in users
        ]
