import pytest
from sqlalchemy.orm import Session

from users.domain.entities.user import User
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)

# Marcamos como test de integración que requiere base de datos
pytestmark = pytest.mark.integration


def create_dummy_user(username: str, email: str) -> User:
    """Helper to create a domain user with a temporary UUID."""
    return User(
        user_id=UserID.from_string("550e8400-e29b-41d4-a716-446655440000"),
        user_role=UserRole(UserRole.SALES_REP),
        firstname=UserFirstName.from_str("Integration"),
        middname=UserMiddName.from_str("Test"),
        lastname=UserLastName.from_str("User"),
        username=UserName(username),
        email=UserEmail.from_string(email),
        password=HashedPassword.from_string("$2b$12$ValidHashForIntegrationTesting..."),
        phone=UserPhoneNumber.from_str("12345678901"),
    )


def test_repo_should_sync_identity_on_insert(session: Session) -> None:
    """
    CRITICAL: Verifies that saving a new user updates the Domain Entity ID
    with the Postgres Autoincrement ID.
    """
    # 1. Arrange
    repo = PostgresUserRepository(session)
    new_user = create_dummy_user("sync_test", "sync@test.com")

    # Pre-assertion: ID is the temp UUID
    assert new_user.id.value == "550e8400-e29b-41d4-a716-446655440000"

    # 2. Act
    repo.save(new_user)

    # 3. Assert
    # The ID should have changed to a numeric string (Postgres ID)
    assert new_user.id.value != "550e8400-e29b-41d4-a716-446655440000"
    assert new_user.id.value.isdigit()  # It must be a number inside a string

    # Verify persistence by retrieving it
    retrieved = repo.get_by_username(UserName("sync_test"))
    assert retrieved is not None
    assert retrieved.id.value == new_user.id.value


def test_repo_should_update_existing_profile(session: Session) -> None:
    """
    Verifies that calling save on an existing user updates the fields correctly.
    """
    # 1. Arrange
    repo = PostgresUserRepository(session)
    user = create_dummy_user("update_test", "update@test.com")
    repo.save(user)  # Insert first

    # 2. Act
    # Modify domain entity
    user._firstname = UserFirstName.from_str("ChangedName")
    user._phone_number = UserPhoneNumber.from_str("99999999999")

    # Save again (Update)
    repo.save(user)

    # 3. Assert
    # Clear session to ensure we fetch from DB, not memory cache
    session.expire_all()
    updated_user = repo.get_by_username(UserName("update_test"))

    assert updated_user is not None
    assert updated_user.firstname.value == "ChangedName"
    assert updated_user.phone_number.value == "99999999999"
    # Identity should persist
    assert updated_user.id.value == user.id.value


def test_repo_should_return_none_for_missing_user(session: Session) -> None:
    """Verifies graceful handling of non-existent users."""
    repo = PostgresUserRepository(session)
    result = repo.get_by_username(UserName("ghost_user"))
    assert result is None
