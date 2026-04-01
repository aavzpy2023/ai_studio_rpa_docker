import sys
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
class RegisterUser:
    """Use case for registering new user accounts securely and atomically."""

    def __init__(self, uow: UnitOfWork, hasher: HashingService):
        """Initializes the use case with Unit of Work and Hashing service."""
        self.uow = uow
        self.hasher = hasher

    def execute(self, request: UserRegisterRequest) -> UserResponse:
        """
        Executes the registration flow within a transactional context.

        Args:
            request: The validated request data from the API.

        Returns:
            UserResponse: The safe representation of the created user.

        Raises:
            ValueError: If constraints are violated (e.g., duplicate email).
        """
        with self.uow:
            # Vinculamos el repo a la sesión actual del UoW
            repo = PostgresUserRepository(self.uow.session)

            # 1. TYPE CASTING & VO CREATION (Fail Fast)
            email_vo = UserEmail.from_string(str(request.email))
            username_vo = UserName(str(request.username))

            # 2. DUPLICITY CHECK
            if repo.get_by_email(email_vo):
                raise ValueError("Email already registered.")

            if repo.get_by_username(username_vo):
                raise ValueError("Username already taken.")

            # 3. PASSWORD VALIDATION (Plaintext Policy)
            _ = UserPassword.from_str(str(request.password))

            # 4. ROLE SECURITY GUARD (Anti-Escalation)
            requested_role = UserRole.from_string(str(request.user_role))
            final_role = requested_role
            if requested_role == UserRole.ADMIN:
                print(
                    f"[SECURITY] ⚠️ Prevented unauthorized ADMIN registration attempt "
                    f"for user: {request.email}",
                    file=sys.stderr,
                )
                final_role = UserRole(UserRole.VIEWER)

            # 5. SECURE HASHING
            hashed_str = self.hasher.hash(str(request.password))
            secure_password = HashedPassword.from_string(hashed_str)

            # 6. ENTITY CONSTRUCTION
            user = User(
                user_id=UserID.from_string(str(uuid4())),
                user_role=final_role,
                firstname=UserFirstName.from_str(str(request.firstname)),
                middname=UserMiddName.from_str(str(request.middname or "")),
                lastname=UserLastName.from_str(str(request.lastname)),
                username=username_vo,
                email=email_vo,
                password=secure_password,
                phone=UserPhoneNumber.from_str(str(request.phone)),
            )

            # 7. PERSISTENCE (Solo add/flush, el commit lo hace el UoW al salir)
            repo.save(user)

            # 8. PERMISSIONS RETRIEVAL (Rehidratación para la respuesta)
            permissions_entities = repo.get_permissions(user.id)
            permissions_list = [p.name.value for p in permissions_entities]

            # El bloque 'with' termina aquí. Si no hubo errores, se ejecuta COMMIT.
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
