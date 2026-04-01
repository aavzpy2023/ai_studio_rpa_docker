from typing import Annotated

from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from kink import di

# Domain Imports
from users.domain.entities.user import User
from users.domain.repositories.user_repo import UserRepository
from users.domain.services.security_services import TokenService
from users.domain.value_objects.user_id import UserID

# OAuth2 Scheme Definition
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")


def get_current_user(token: Annotated[str, Depends(oauth2_scheme)]) -> User:
    """
    Decodes the JWT and retrieves the User Entity.
    Explicit return type '-> User' fixes downstream inference errors.
    """
    token_service: TokenService = di[TokenService]  # type: ignore[type-abstract]
    repo: UserRepository = di[UserRepository]  # type: ignore[type-abstract]

    try:
        payload = token_service.decode_access_token(token)
        user_id_str = payload.get("sub")

        token_sid = payload.get("sid")

        if not user_id_str:
            raise HTTPException(status_code=401, detail="Invalid token")

        user = repo.get_by_id(UserID.from_string(str(user_id_str)))

        if not user or not user.is_active:
            raise HTTPException(status_code=401, detail="User disabled or not found")

        if user.session_id and token_sid != user.session_id:
            print(
                f"[SECURITY_DEBUG] SID Mismatch! DB:"
                f" {user.session_id} vs Token: {token_sid}"
            )
            raise HTTPException(
                status_code=401, detail="Session expired (SID Mismatch)"
            )

        return user

    except HTTPException:
        raise
    except ValueError as e:
        raise HTTPException(status_code=401, detail=f"Identity error: {str(e)}") from e
    except Exception as e:
        # Guard against any other infrastructure failure
        print(f"[SECURITY CRITICAL] get_current_user failed: {e}")
        raise HTTPException(status_code=500, detail="Internal security failure") from e


class RequirePermission:
    """
    FastAPI Dependency to enforce granular RBAC.
    """

    def __init__(self, required_permission: str):
        self.required_permission = required_permission

    def __call__(self, user: Annotated[User, Depends(get_current_user)]) -> User:
        """
        Validates user permissions.
        """
        repo: UserRepository = di[UserRepository]  # type: ignore[type-abstract]

        permissions = repo.get_permissions(user.id)

        has_perm = any(p.name.value == self.required_permission for p in permissions)

        if not has_perm and not user.is_admin():
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail=f"Missing required permission: {self.required_permission}",
            )
        return user
