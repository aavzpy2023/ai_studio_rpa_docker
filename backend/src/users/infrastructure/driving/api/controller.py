"""FastAPI controllers for user management module."""

import os
from typing import Annotated

from fastapi import APIRouter, Depends, HTTPException, Request, status
from fastapi.responses import Response
from kink import di
from pydantic import BaseModel

from infrastructure.config.limiter import limiter

# DTOs
from users.application.dtos import (
    PermissionCatalogResponse,
    RoleCreateRequest,
    RoleMatrixResponse,
    TokenResponse,
    UserLoginRequest,
    UserRegisterRequest,
    UserResponse,
    UserUpdateProfileRequest,
)
from users.application.use_cases.create_role import CreateRole
from users.application.use_cases.create_user import CreateUser
from users.application.use_cases.delete_role import DeleteRole

# Use Cases
from users.application.use_cases.get_all_users import GetAllUsers
from users.application.use_cases.login_user import LoginUser
from users.application.use_cases.refresh_session import RefreshSession
from users.application.use_cases.register_user import RegisterUser
from users.application.use_cases.toggle_user_status import ToggleUserStatus
from users.application.use_cases.update_user_profile import UpdateUserProfile
from users.application.use_cases.update_user_role import UpdateUserRole
from users.domain.entities.user import User
from users.domain.exceptions import (
    DuplicateUserError,
    UserDomainError,
    UserNotFoundError,
)
from users.domain.repositories.user_repo import UserRepository
from users.domain.services.permission_tree_builder import PermissionTreeBuilder

# Security Adapter
from .security import RequirePermission, get_current_user

# --- ROUTER 1: AUTHENTICATION (Public Access + IAM) ---
auth_router = APIRouter(prefix="/auth", tags=["Auth"])


def _set_auth_cookies(response: Response, refresh_token: str) -> None:
    """
    Sets the Refresh Token in a secure HTTP-Only cookie.
    Directly modifies the FastAPI Response object.
    """
    response.set_cookie(
        key="refresh_token",
        value=refresh_token,
        httponly=True,  # CRITICAL: Blocks JS access (XSS Protection)
        secure=os.getenv("ENVIRONMENT") == "production",
        samesite="lax",  # CSRF Protection
        max_age=7 * 24 * 60 * 60,  # 7 Days
        path="/api/auth",  # Scoped only to auth endpoints
    )


@auth_router.post(
    "/register",
    response_model=UserResponse,
    status_code=status.HTTP_201_CREATED,
    summary="Register new user",
)
async def register(request: UserRegisterRequest) -> UserResponse:
    try:
        use_case = di[RegisterUser]
        return use_case.execute(request)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e)) from e
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"System Error: {str(e)}") from e


@auth_router.post(
    "/login",
    response_model=TokenResponse,
    status_code=status.HTTP_200_OK,
    summary="Login and get token",
)
@limiter.limit("5/minute")
async def login(
    response: Response, request: Request, request_data: UserLoginRequest
) -> TokenResponse:
    try:
        use_case = di[LoginUser]
        result = use_case.execute(request_data)

        # SECURITY: Move refresh token to HTTP-Only Cookie
        if result.refresh_token:
            _set_auth_cookies(response, result.refresh_token)
            # Remove from JSON body so client JS cannot see it
            result.refresh_token = None

        return result
    except ValueError as e:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED, detail=str(e)
        ) from e
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"System Error: {str(e)}",
        ) from e


# --- IAM ENDPOINTS (ADMIN ONLY) ---
@auth_router.post("/refresh", response_model=TokenResponse)
async def refresh_token(request: Request, response: Response) -> TokenResponse:
    """
    Renews the access token using the HTTP-Only Refresh Cookie.
    """
    # 1. Extract Token from Cookie
    refresh_token = request.cookies.get("refresh_token")
    if not refresh_token:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Refresh token missing",
        )

    try:
        # 2. Execute Use Case
        use_case = di[RefreshSession]
        result = use_case.execute(refresh_token)

        # 3. Rotate Cookie (Security Best Practice)
        if result.refresh_token:
            _set_auth_cookies(response, result.refresh_token)
            result.refresh_token = None

        return result

    except ValueError as e:
        # Clear invalid cookie
        response.delete_cookie("refresh_token")
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail=str(e),
        ) from None


@auth_router.post("/logout", status_code=status.HTTP_204_NO_CONTENT)
async def logout(response: Response) -> None:
    """
    Secure logout by clearing the HTTP-Only cookie.
    """
    response.delete_cookie("refresh_token", path="/api/auth")


@auth_router.get("/roles", response_model=list[RoleMatrixResponse])
async def list_roles_matrix(
    user: Annotated[User, Depends(get_current_user)],
) -> list[RoleMatrixResponse]:
    """Retrieve roles and their permissions. Admin Only."""
    if not user.is_admin():
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Only admins can view the security matrix.",
        )
    repo = di[UserRepository]  # type: ignore[type-abstract]
    # Mapeo directo del dict retornado por el repo al DTO Pydantic
    return [RoleMatrixResponse(**r) for r in repo.get_all_roles()]


@auth_router.post(
    "/roles",
    status_code=status.HTTP_201_CREATED,
    summary="Create dynamic role",
)
async def create_system_role(
    request: RoleCreateRequest,
    user: Annotated[User, Depends(get_current_user)],
) -> dict[str, str]:
    """Define a new security role. Admin Only."""
    if not user.is_admin():
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN, detail="Access denied."
        )

    try:
        use_case = di[CreateRole]
        use_case.execute(request.name)
        return {"status": "success", "message": f"Role '{request.name}' created."}
    except DuplicateUserError as e:
        raise HTTPException(status_code=400, detail=str(e)) from e
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e)) from e


@auth_router.delete(
    "/roles/{role_name}",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Delete dynamic role",
)
async def delete_system_role(
    role_name: str,
    user: Annotated[User, Depends(get_current_user)],
) -> None:
    """
    Remove a role. Fails if System Role or Assigned to Users.
    Admin Only.
    """
    if not user.is_admin():
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN, detail="Access denied."
        )

    try:
        use_case = di[DeleteRole]
        use_case.execute(role_name)
    except UserDomainError as e:
        raise HTTPException(status_code=409, detail=str(e)) from e
    except ValueError as e:
        raise HTTPException(status_code=404, detail=str(e)) from e


@auth_router.get("/permissions", response_model=list[PermissionCatalogResponse])
async def list_permissions_catalog(
    user: Annotated[User, Depends(get_current_user)],
) -> list[PermissionCatalogResponse]:
    """Retrieve system permission catalog. Admin Only."""
    if not user.is_admin():
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN, detail="Access denied."
        )
    repo = di[UserRepository]  # type: ignore[type-abstract]
    entities = repo.get_all_permissions()
    return [
        PermissionCatalogResponse(
            id=p.id, name=p.name.value, resource=p.resource, description=p.description
        )
        for p in entities
    ]


@auth_router.post("/roles/{role_id}/permissions/{perm_id}/toggle")
async def toggle_role_permission(
    role_id: int, perm_id: int, user: Annotated[User, Depends(get_current_user)]
) -> dict[str, str]:
    """Grant or revoke a permission. Admin Only."""
    if not user.is_admin():
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Unauthorized escalation attempt.",
        )
    repo = di[UserRepository]  # type: ignore[type-abstract]
    repo.toggle_permission(role_id, perm_id)
    return {"status": "success"}


@auth_router.get("/permissions/tree")
async def get_permission_tree(
    user: Annotated[User, Depends(get_current_user)],
) -> dict[str, dict[str, list[dict[str, object]]]]:
    """
    Retrieve permissions structured as a hierarchical tree.
    Format: Module -> Resource -> Actions.
    Admin Only.
    """
    if not user.is_admin():
        raise HTTPException(status_code=403, detail="Access denied")

    repo = di[UserRepository]  # type: ignore[type-abstract]
    builder = di[PermissionTreeBuilder]

    all_permissions = repo.get_all_permissions()
    return builder.build(all_permissions)


# --- ROUTER 2: USER MANAGEMENT (Protected Access) ---
user_router = APIRouter(prefix="/users", tags=["User Management"])


class UpdateRoleRequest(BaseModel):
    """Simple DTO for role updates."""

    role: str


@user_router.get(
    "/",
    response_model=list[UserResponse],
    summary="List all users",
    description="Retrieve full directory. Requires USERS_READ permission.",
)
async def list_users(
    # Guard: Requires USERS_READ
    _: Annotated[User, Depends(RequirePermission("USERS_READ"))],
) -> list[UserResponse]:
    try:
        use_case = di[GetAllUsers]
        return use_case.execute()
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"Error fetching users: {str(e)}",
        ) from e


@user_router.patch(
    "/{user_id}/role",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Update user role",
    description="Change a user's role. Requires USERS_WRITE permission.",
)
async def update_role(
    user_id: str,
    request: UpdateRoleRequest,
    # Guard: Requires USERS_WRITE
    _: Annotated[User, Depends(RequirePermission("USERS_WRITE"))],
) -> None:
    try:
        use_case = di[UpdateUserRole]
        use_case.execute(user_id, request.role)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e)) from e
    except UserNotFoundError as e:
        raise HTTPException(status_code=404, detail=str(e)) from e
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=f"System Error: {str(e)}",
        ) from e


@user_router.put(
    "/{user_id}",
    response_model=UserResponse,
    summary="Update user profile",
    description="Update mutable user details. Requires USERS_WRITE permission.",
)
async def update_user(
    user_id: str,
    request: UserUpdateProfileRequest,
    # Guard: Requires USERS_WRITE
    _: Annotated[User, Depends(RequirePermission("USERS_WRITE"))],
) -> UserResponse:
    try:
        use_case = di[UpdateUserProfile]
        return use_case.execute(user_id, request)
    except UserNotFoundError as e:
        raise HTTPException(status_code=404, detail=str(e)) from e
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e)) from e
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=str(e),
        ) from e


@user_router.patch(
    "/{user_id}/status",
    status_code=status.HTTP_204_NO_CONTENT,
    summary="Toggle user active status",
    description="Soft delete or reactivate. Requires USERS_WRITE permission.",
)
async def toggle_status(
    user_id: str,
    # Guard: Requires USERS_WRITE
    _: Annotated[User, Depends(RequirePermission("USERS_WRITE"))],
) -> None:
    try:
        use_case = di[ToggleUserStatus]
        use_case.execute(user_id)
    except UserNotFoundError as e:
        raise HTTPException(status_code=404, detail=str(e)) from e
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail=str(e),
        ) from e


@user_router.post(
    "/",
    response_model=UserResponse,
    status_code=status.HTTP_201_CREATED,
    summary="Create User (Admin)",
    description="Administrative creation of users. Allows defining roles."
    " Requires USERS_WRITE.",
)
async def create_user_admin(
    request: UserRegisterRequest,
    # SECURITY GUARD: Only admins/managers with write access can hit this.
    _: Annotated[User, Depends(RequirePermission("USERS_WRITE"))],
) -> UserResponse:
    try:
        use_case = di[CreateUser]
        return use_case.execute(request)
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e)) from e
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e)) from e
