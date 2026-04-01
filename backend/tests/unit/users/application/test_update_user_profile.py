from unittest.mock import Mock

import pytest

from users.application.dtos import UserUpdateProfileRequest
from users.application.use_cases.update_user_profile import UpdateUserProfile
from users.domain.entities.user import User
from users.domain.exceptions import UserNotFoundError
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
def mock_user_repo() -> Mock:
    """Fixture: Mocks the UserRepository interface."""
    return Mock()


@pytest.fixture
def use_case(mock_user_repo: Mock) -> UpdateUserProfile:
    """Fixture: Instantiates the Use Case with injected mock repository."""
    return UpdateUserProfile(mock_user_repo)


@pytest.fixture
def existing_user() -> User:
    """Fixture: Creates a valid User entity representing existing database state."""
    return User(
        user_id=UserID.from_string("550e8400-e29b-41d4-a716-446655440000"),
        user_role=UserRole(UserRole.SALES_REP),
        firstname=UserFirstName.from_str("OriginalFirst"),
        middname=UserMiddName.from_str("OriginalMiddle"),
        lastname=UserLastName.from_str("OriginalLast"),
        username=UserName("original_user"),
        email=UserEmail.from_string("user@example.com"),
        password=HashedPassword.from_string(
            "$2b$12$LongerHashStringToSatisfyDomainValidationRules..."
        ),
        phone=UserPhoneNumber.from_str("11111111111"),
    )


class TestUpdateUserProfile:
    """Unit tests for the UpdateUserProfile use case."""

    def test_should_update_user_attributes_successfully(
        self,
        use_case: UpdateUserProfile,
        mock_user_repo: Mock,
        existing_user: User,
    ) -> None:
        """
        Scenario: Valid request with full data.
        Expected: User entity is updated with new values and persisted.
        """
        # 1. Arrange
        user_id = "550e8400-e29b-41d4-a716-446655440000"
        request = UserUpdateProfileRequest(
            firstname="UpdatedFirst",
            lastname="UpdatedLast",
            phone="99999999999",
            middname="UpdatedMiddle",
        )

        mock_user_repo.get_by_id.return_value = existing_user
        mock_user_repo.get_permissions.return_value = []

        # 2. Act
        use_case.execute(user_id, request)

        # 3. Assert
        # Verify internal state change in the Entity
        assert existing_user.firstname.value == "UpdatedFirst"
        assert existing_user.lastname.value == "UpdatedLast"
        assert existing_user.middname.value == "UpdatedMiddle"
        assert existing_user.phone_number.value == "99999999999"

        # Verify persistence interaction
        mock_user_repo.save.assert_called_once_with(existing_user)

    def test_should_raise_error_when_user_not_found(
        self,
        use_case: UpdateUserProfile,
        mock_user_repo: Mock,
    ) -> None:
        """
        Scenario: User ID does not exist in the repository.
        Expected: UserNotFoundError is raised.
        """
        # 1. Arrange
        user_id = "550e8400-e29b-41d4-a716-446655440000"
        request = UserUpdateProfileRequest(
            firstname="Any", lastname="Any", phone="00000000000"
        )

        mock_user_repo.get_by_id.return_value = None

        # 2. Act & Assert
        with pytest.raises(UserNotFoundError):
            use_case.execute(user_id, request)

        # Verify no side effects (persistence should not be called)
        mock_user_repo.save.assert_not_called()

    def test_should_handle_optional_middlename_update(
        self,
        use_case: UpdateUserProfile,
        mock_user_repo: Mock,
        existing_user: User,
    ) -> None:
        """
        Scenario: Updating profile without providing a middle name.
        Expected: Entity handles optional fields correctly.
        """
        # 1. Arrange
        user_id = existing_user.id.value
        request = UserUpdateProfileRequest(
            firstname="NewName",
            lastname="NewLast",
            phone="12345678901",
            middname=None,  # Not provided in request
        )

        mock_user_repo.get_by_id.return_value = existing_user
        mock_user_repo.get_permissions.return_value = []

        original_middname = existing_user.middname.value

        # 2. Act
        use_case.execute(user_id, request)

        # 3. Assert
        assert existing_user.firstname.value == "NewName"
        # Ensure optional field remained unchanged (based on current implementation
        # logic)
        assert existing_user.middname.value == original_middname

        mock_user_repo.save.assert_called_once()
