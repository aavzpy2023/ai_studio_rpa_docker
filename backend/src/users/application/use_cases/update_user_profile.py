from kink import inject

from users.application.dtos import UserResponse, UserUpdateProfileRequest
from users.domain.exceptions import UserNotFoundError
from users.domain.repositories.user_repo import UserRepository
from users.domain.value_objects.user_id import UserID


@inject
class UpdateUserProfile:
    def __init__(self, repository: UserRepository):
        self.repository = repository

    def execute(self, user_id: str, request: UserUpdateProfileRequest) -> UserResponse:
        uid = UserID.from_string(user_id)
        user = self.repository.get_by_id(uid)

        if not user:
            raise UserNotFoundError(f"User {user_id} not found")

        # Domain Logic Execution
        user.update_profile(
            firstname=request.firstname,
            lastname=request.lastname,
            phone=request.phone,
            middname=request.middname,
        )

        # Persistence
        self.repository.save(user)

        # Response Mapping (Should ideally use a Mapper class)
        permissions_entities = self.repository.get_permissions(user.id)
        permissions_list = [p.name.value for p in permissions_entities]

        return UserResponse(
            id=user.id.value,
            username=user.username.value,
            email=user.email.value,
            firstname=user.firstname.value,
            lastname=user.lastname.value,
            role=user.role.value,
            permissions=permissions_list,
            created_at=user.created_at.isoformat(),
            phone=user.phone_number.value,
            middname=user.middname.value if user.middname else None,
            active=user.is_active,
        )
