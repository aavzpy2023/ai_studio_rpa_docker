from unittest.mock import MagicMock, Mock, patch

import pytest

from users.application.dtos import UserRegisterRequest
from users.application.use_cases.register_user import RegisterUser
from users.domain.entities.user import User
from users.domain.services.security_services import HashingService
from users.domain.value_objects.user_role import UserRole


@pytest.fixture
def mock_uow() -> MagicMock:
    """Provides a MagicMock that supports context manager protocol."""
    uow = MagicMock()
    # Ensure session is also a Mock
    uow.session = Mock()
    return uow


@pytest.fixture
def mock_hasher() -> Mock:
    hasher = Mock(spec=HashingService)
    hasher.hash.return_value = "$2b$12$MockedHashedPasswordForTesting..."
    return hasher


@pytest.fixture
def use_case(mock_uow: MagicMock, mock_hasher: Mock) -> RegisterUser:
    return RegisterUser(mock_uow, mock_hasher)


@pytest.fixture
def valid_register_request() -> UserRegisterRequest:
    return UserRegisterRequest(
        firstname="John",
        lastname="Doe",
        username="jdoe",
        email="john.doe@example.com",
        password="StrongPassword123!",
        phone="12345678901",
        user_role="sales_rep",
    )


class TestRegisterUser:
    @patch("users.application.use_cases.register_user.PostgresUserRepository")
    def test_should_register_user_successfully(
        self,
        mock_repo_class: Mock,
        use_case: RegisterUser,
        mock_uow: MagicMock,
        mock_hasher: Mock,
        valid_register_request: UserRegisterRequest,
    ) -> None:
        """Scenario: Valid registration data."""
        # Configurar el Mock que devuelve el constructor
        mock_repo_instance = mock_repo_class.return_value
        mock_repo_instance.get_by_email.return_value = None
        mock_repo_instance.get_by_username.return_value = None
        mock_repo_instance.get_permissions.return_value = []

        response = use_case.execute(valid_register_request)

        # Verificaciones
        # 1. Se usó el contexto transaccional
        mock_uow.__enter__.assert_called()

        # 2. Se instanció el repo con la sesión del UoW
        mock_repo_class.assert_called_with(mock_uow.session)

        # 3. Se llamó a save
        mock_repo_instance.save.assert_called_once()

        mock_hasher.hash.assert_called_once()
        assert response.email == "john.doe@example.com"

    @patch("users.application.use_cases.register_user.PostgresUserRepository")
    def test_should_prevent_privilege_escalation(
        self,
        mock_repo_class: Mock,
        use_case: RegisterUser,
        valid_register_request: UserRegisterRequest,
    ) -> None:
        """Scenario: Malicious role escalation attempt."""
        valid_register_request.user_role = "admin"

        mock_repo_instance = mock_repo_class.return_value
        mock_repo_instance.get_by_email.return_value = None
        mock_repo_instance.get_by_username.return_value = None
        mock_repo_instance.get_permissions.return_value = []

        use_case.execute(valid_register_request)

        # Verificar argumento de save
        saved_user: User = mock_repo_instance.save.call_args[0][0]
        assert saved_user.role == UserRole.VIEWER

    @patch("users.application.use_cases.register_user.PostgresUserRepository")
    def test_should_fail_on_duplicate_email(
        self,
        mock_repo_class: Mock,
        use_case: RegisterUser,
        valid_register_request: UserRegisterRequest,
    ) -> None:
        mock_repo_instance = mock_repo_class.return_value
        mock_repo_instance.get_by_email.return_value = Mock(spec=User)

        with pytest.raises(ValueError, match="Email already registered"):
            use_case.execute(valid_register_request)

    @patch("users.application.use_cases.register_user.PostgresUserRepository")
    def test_should_fail_on_duplicate_username(
        self,
        mock_repo_class: Mock,
        use_case: RegisterUser,
        valid_register_request: UserRegisterRequest,
    ) -> None:
        mock_repo_instance = mock_repo_class.return_value
        mock_repo_instance.get_by_email.return_value = None
        mock_repo_instance.get_by_username.return_value = Mock(spec=User)

        with pytest.raises(ValueError, match="Username already taken"):
            use_case.execute(valid_register_request)
