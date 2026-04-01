from kink import inject

from users.application.dtos import TokenResponse, UserResponse
from users.domain.repositories.user_repo import UserRepository
from users.domain.services.security_services import TokenService
from users.domain.value_objects.user_id import UserID


@inject
class RefreshSession:
    """
    Validates a refresh token and issues a new access token pair.
    Ensures the user is still active and the token is valid.
    """

    def __init__(self, repository: UserRepository, token_service: TokenService):
        self.repository = repository
        self.token_service = token_service

    def execute(self, refresh_token: str) -> TokenResponse:
        # 1. Decode & Verify Signature (Raises error if invalid/expired)
        payload = self.token_service.decode_access_token(refresh_token)

        # 2. Token Type Check (Prevent Access Token reuse as Refresh Token)
        if payload.get("type") != "refresh":
            raise ValueError("Invalid token type")

        # 3. User Rehydration & Security Check
        user_id_str = payload.get("sub")
        if not user_id_str:
            raise ValueError("Invalid token payload")

        user = self.repository.get_by_id(UserID.from_string(user_id_str))
        if not user or not user.is_active:
            raise ValueError("User account is disabled or not found")

        # Ensure the Refresh Token belongs to the currently active session.
        token_sid = payload.get("sid")
        if user.session_id and token_sid != user.session_id:
            # Token rotation detected or session superseded by another login
            raise ValueError("Session expired (Concurrent login detected)")

        # 4. Generate New Tokens
        # Rotation: We issue a new Access Token AND a new Refresh Token
        # to prevent replay attacks if the old refresh token was stolen.
        token_payload = {
            "sub": user.id.value,
            "role": user.role.value,
            "email": user.email.value,
            "username": user.username.value,
            "sid": user.session_id,
        }

        new_access = self.token_service.create_access_token(token_payload)
        # Optional: Token Rotation Policy (Issue new refresh token too)
        new_refresh = self.token_service.create_refresh_token(token_payload)

        # 5. Map Response
        permissions_entities = self.repository.get_permissions(user.id)
        permissions_list = [p.name.value for p in permissions_entities]

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

        return TokenResponse(
            access_token=new_access,
            refresh_token=new_refresh,
            user=user_resp,
        )
