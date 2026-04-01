from typing import Any

import pytest

from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName


@pytest.fixture
def valid_hashed_password() -> HashedPassword:
    """
    Provides a pre-computed HashedPassword object.
    In a real scenario, this  would be the output of BcryptAdapter.
    """
    return HashedPassword.from_string("$2b$12$K387/f8.S89W.r89W.r89W.ExampleHashValue")


@pytest.fixture
def valid_user_params(valid_hashed_password: HashedPassword) -> dict[str, Any]:
    """
    Provides a standardized dictionary of valid Domain Value Objects
    required to construct a User Entity.

    Updated to use HashedPassword instead of UserPassword to satisfy
    the current User entity constructor (Security Refactor).
    """
    return {
        "user_id": UserID.from_string("550e8400-e29b-41d4-a716-446655440000"),
        "user_role": UserRole(UserRole.ADMIN),
        "firstname": UserFirstName.from_str("Andrey"),
        "middname": UserMiddName.from_str("Vinajera"),
        "lastname": UserLastName.from_str("Zamora"),
        "username": UserName("avinajera"),
        "email": UserEmail.from_string("admin@dfgchatai.com"),
        "password": valid_hashed_password,  # Strict HashedPassword type
        "phone": UserPhoneNumber.from_str("12345678901"),
    }


@pytest.fixture
def raw_password_str() -> str:
    """
    Utility fixture providing a valid plaintext password for tests
    that involve the hashing process (like RegisterUser or UserPassword VO).
    """
    return "StrongPass123!"
