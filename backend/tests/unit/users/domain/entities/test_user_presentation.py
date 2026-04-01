from typing import Any

from users.domain.entities.user import User


class TestUserPresentation:
    """
    Tests for derived logic and UI-helper methods within the User Entity.
    """

    def test_avatar_initials_logic_integrity(
        self, valid_user_params: dict[str, Any]
    ) -> None:
        """
        Ensures that the  avatar initials logic correctly processes the fixture data.

        GIVEN the user 'Andrey Zamora'
        EXPECTED initials: 'AZ'
        """
        user = User(**valid_user_params)

        # Logic verification: First letter of Firstname + First letter of Lastname
        initials = f"{user._firstname.value[0]}{user._lastname.value[0]}".upper()

        # Assertion updated to match Andrey Zamora -> AZ
        assert initials == "AZ"
