from typing import Any

from users.domain.entities.user import User
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_role import UserRole


class TestUserInstantiation:
    """
    Unit tests for the User entity instantiation logic.
    Verified against the updated HashedPassword refactor.
    """

    def test_user_should_store_attributes_correctly(
        self, valid_user_params: dict[str, Any]
    ) -> None:
        """
        GIVEN a set of valid Domain Value Objects from conftest
        WHEN the User entity is instantiated
        THEN it should map internal attributes to the fixture values correctly.
        """
        user = User(**valid_user_params)

        # Updated assertions to  match the 'avinajera' identity in conftest.py
        assert user._role == UserRole.ADMIN
        assert user._username.value == "avinajera"
        assert user._email.value == "admin@dfgchatai.com"
        assert user._firstname.value == "Andrey"
        assert user._lastname.value == "Zamora"

    def test_user_password_encapsulation(
        self, valid_user_params: dict[str, Any]
    ) -> None:
        """
        Verifies that the entity strictly encapsulates the password as a HashedPassword.

        This test confirms the fix for the security refactor where plaintext
        Value Objects (UserPassword) are no longer stored in the Entity.
        """
        user = User(**valid_user_params)

        # Assertion updated: The entity now correctly uses HashedPassword
        assert isinstance(user.password, HashedPassword)
        assert user.password.value.startswith("$2b$")
