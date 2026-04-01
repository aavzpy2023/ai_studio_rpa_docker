"""Data Transfer Objects (DTOs) for user operations.

This module defines Pydantic models for request/response validation in user
management operations. These DTOs enforce data validation rules at the API
boundary before data reaches the domain layer.
"""

from pydantic import BaseModel, ConfigDict, Field


class UserRegisterRequest(BaseModel):
    """Request model for user registration.

    Validates incoming registration data with appropriate constraints
    for each field. Password strength requirements are enforced at the
    domain layer via UserPassword value object.

    Attributes:
        firstname: User's first name (2-100 characters).
        lastname: User's last name (2-100 characters).
        username: Unique username (3-50 characters).
        email: Valid email address.
        password: Password (minimum 8 characters).
        phone: Phone number (exactly 11 digits).
        middname: Optional middle name.
    """

    model_config = ConfigDict(extra="forbid", str_strip_whitespace=True)
    firstname: str = Field(..., min_length=2, max_length=100)
    lastname: str = Field(..., min_length=2, max_length=100)
    username: str = Field(..., min_length=3, max_length=50)
    email: str = Field(..., min_length=3, max_length=50)
    password: str = Field(..., min_length=8, description="Must be strong.")
    phone: str = Field(..., pattern=r"^\d{11}$")
    middname: str | None = None
    user_role: str = Field(
        default="viewer", description="The assigned business role for the user."
    )


class UserLoginRequest(BaseModel):
    """Request model for user login.

    Accepts either username or email as the identifier. The use case
    determines which based on the presence of '@' symbol.

    Attributes:
        identifier: Username or email address.
        password: User's password (plaintext, will be verified against hash).
    """

    identifier: str
    password: str


class UserResponse(BaseModel):
    """Response model containing user information.

    Returns safe (non-sensitive) user data. Password and other sensitive
    information are never included in responses.

    Attributes:
        id: Unique user identifier (UUID).
        username: User's username.
        email: User's email address.
        firstname: User's first name.
        lastname: User's last name.
        role: User's role (e.g., 'user', 'admin').
        created_at: Account creation timestamp (ISO format).
    """

    id: str
    username: str
    email: str
    firstname: str
    lastname: str
    role: str
    created_at: str
    permissions: list[str] = []
    active: bool = True
    phone: str | None = None
    middname: str | None = None


class TokenResponse(BaseModel):
    """Response model for authentication tokens.

    Returned after successful login or registration, containing both
    the JWT access token and user information.

    Attributes:
        access_token: JWT token for authenticated requests.
        token_type: Token type (always 'bearer').
        user: User information.
    """

    access_token: str
    refresh_token: str | None = None
    token_type: str = "bearer"
    user: UserResponse


class UserUpdateProfileRequest(BaseModel):
    firstname: str = Field(..., min_length=2, max_length=100)
    lastname: str = Field(..., min_length=2, max_length=100)
    phone: str = Field(..., pattern=r"^\d{11}$")
    middname: str | None = None


class RoleMatrixResponse(BaseModel):
    """Represents a role and its associated permission names for the IAM Matrix."""

    id: int
    name: str
    is_system: bool
    permissions: list[str]


class PermissionCatalogResponse(BaseModel):
    """Represents a system permission in the catalog."""

    id: int
    name: str
    resource: str
    description: str | None = None


class RoleCreateRequest(BaseModel):
    """
    Payload for creating a new system role.
    Validates against UserRole Value Object rules.
    """

    name: str = Field(
        ...,
        min_length=3,
        max_length=50,
        pattern=r"^[a-zA-Z][a-zA-Z0-9_]*$",
        description="Snake_case format required. No spaces.",
    )
