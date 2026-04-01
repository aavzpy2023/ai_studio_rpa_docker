"""User login use case with security lockout policy and atomic integrity."""

from datetime import UTC, datetime

from kink import inject

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.application.dtos import TokenResponse, UserLoginRequest, UserResponse
from users.domain.services.security_services import HashingService, TokenService
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_username import UserName
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)


@inject
class LoginUser:
    """Use case for authenticating users via Unit of Work."""

    def __init__(
        self,
        uow: UnitOfWork,
        hasher: HashingService,
        token_service: TokenService,
    ):
        self.uow = uow
        self.hasher = hasher
        self.token_service = token_service

    def execute(self, request: UserLoginRequest) -> TokenResponse:
        """
        Executes the login flow.
        Uses UoW to guarantee reading from the correct store and atomic updates.
        """
        with self.uow:
            repo = PostgresUserRepository(self.uow.session)

            # 1. Retrieve User (Heuristic Strategy)
            if "@" in request.identifier:
                email_vo = UserEmail.from_string(str(request.identifier))
                user = repo.get_by_email(email_vo)
            else:
                username_vo = UserName(str(request.identifier))
                user = repo.get_by_username(username_vo)

            # Security: Generic message if user doesn't exist
            if not user:
                raise ValueError("Invalid credentials")

            if not user.is_active:
                raise ValueError("Account is disabled. Please contact support.")

            # 2. Security Check: Lockout Policy (Fail Fast)
            if user.is_locked:
                now = datetime.now(UTC)
                delta = user.lockout_until - now  # type: ignore
                minutes_left = max(1, int(delta.total_seconds() / 60))

                raise ValueError(
                    f"Account temporarily locked due to multiple failed attempts. "
                    f"Please try again in {minutes_left} minutes."
                )

            # 3. Credential Verification
            if not self.hasher.verify(request.password, user.password.value):
                # Record failed attempt
                user.record_failed_attempt()
                repo.save(user)

                # CRITICAL: Commit the failed attempt BEFORE raising exception.
                # If we don't commit here, the exception will trigger UoW rollback,
                # and the security counter won't increase.
                self.uow.commit()

                raise ValueError("Invalid credentials")

            # 4. Success Flow
            user.reset_attempts()
            current_session_id = user.rotate_session_id()
            repo.save(user)

            # 5. Token Generation
            token_payload = {
                "sub": user.id.value,
                "role": user.role.value,
                "email": user.email.value,
                "username": user.username.value,
                "sid": current_session_id,
            }
            access_token = self.token_service.create_access_token(token_payload)
            refresh_token = self.token_service.create_refresh_token(token_payload)
            permissions_entities = repo.get_permissions(user.id)
            permissions_list = [p.name.value for p in permissions_entities]

            # 6. Response Construction
            user_resp = UserResponse(
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

            # Commit success state (reset attempts) handled by context manager exit
            return TokenResponse(
                access_token=access_token, refresh_token=refresh_token, user=user_resp
            )
