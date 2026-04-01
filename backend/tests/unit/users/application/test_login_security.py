from datetime import UTC, datetime, timedelta
from unittest.mock import MagicMock, Mock

import pytest
from pytest_mock import MockerFixture

from users.application.dtos import UserLoginRequest
from users.application.use_cases.login_user import LoginUser
from users.domain.entities.user import User
from users.domain.services.security_services import HashingService, TokenService


class TestLoginSecurity:
    """
    Verifies Security Policies defined in the Login Use Case.
    Focus: Account Lockout Mechanism.
    """

    @pytest.fixture
    def mock_deps(self) -> tuple[MagicMock, Mock, Mock]:
        uow = MagicMock()
        uow.session = Mock()
        hasher = Mock(spec=HashingService)
        token_service = Mock(spec=TokenService)
        return uow, hasher, token_service

    def test_should_enforce_lockout_policy(
        self, mocker: MockerFixture, mock_deps: tuple[MagicMock, Mock, Mock]
    ) -> None:
        """
        Scenario: User attempts login but 'lockout_until' is in the future.
        Expected: ValueError with specific lockout message.
        """
        # 1. Arrange
        uow, hasher, token_service = mock_deps
        use_case = LoginUser(uow, hasher, token_service)

        # Define Request
        request = UserLoginRequest(identifier="user@test.com", password="password")

        # Mock Domain User
        mock_user = Mock(spec=User)
        mock_user.is_active = True
        mock_user.is_locked = True  # Property
        mock_user.lockout_until = datetime.now(UTC) + timedelta(minutes=15)

        # Mock Repository behavior via patching
        # Note: We patch the class where it is IMPORTED, not where it is defined
        mock_repo_class = mocker.patch(
            "users.application.use_cases.login_user.PostgresUserRepository"
        )
        mock_repo_instance = mock_repo_class.return_value
        mock_repo_instance.get_by_email.return_value = mock_user

        # 2. Act & Assert
        with pytest.raises(ValueError) as excinfo:
            use_case.execute(request)

        # 3. Validation
        assert "Account temporarily locked" in str(excinfo.value)
        # Ensure no password verification was attempted (Fail Fast)
        hasher.verify.assert_not_called()
