from uuid import uuid4

from kink import inject

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.application.dtos import UserRegisterRequest, UserResponse
from users.domain.entities.user import User
from users.domain.services.security_services import HashingService
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_password import UserPassword
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)


@inject
class CreateUser:
    def __init__(self, uow: UnitOfWork, hasher: HashingService):
        self.uow = uow
        self.hasher = hasher

    def execute(self, request: UserRegisterRequest) -> UserResponse:
        with self.uow:
            repo = PostgresUserRepository(self.uow.session)

            email_vo = UserEmail.from_string(str(request.email))
            username_vo = UserName(str(request.username))

            if repo.get_by_email(email_vo):
                raise ValueError("Email already registered.")
            if repo.get_by_username(username_vo):
                raise ValueError("Username already taken.")

            _ = UserPassword.from_str(str(request.password))
            assigned_role = UserRole.from_string(str(request.user_role))
            hashed_str = self.hasher.hash(str(request.password))

            user = User(
                user_id=UserID.from_string(str(uuid4())),
                user_role=assigned_role,
                firstname=UserFirstName.from_str(str(request.firstname)),
                middname=UserMiddName.from_str(str(request.middname or "")),
                lastname=UserLastName.from_str(str(request.lastname)),
                username=username_vo,
                email=email_vo,
                password=HashedPassword.from_string(hashed_str),
                phone=UserPhoneNumber.from_str(str(request.phone)),
            )

            repo.save(user)
            permissions_entities = repo.get_permissions(user.id)
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
                active=user.is_active,
                phone=user.phone_number.value,
                middname=user.middname.value if user.middname else None,
            )
