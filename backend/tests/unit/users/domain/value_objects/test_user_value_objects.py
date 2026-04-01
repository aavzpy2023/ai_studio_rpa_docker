import pytest

from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_password import UserPassword
from users.domain.value_objects.user_role import UserRole


class TestUserValueObjects:
    def test_email_should_raise_error_if_invalid(self) -> None:
        """Ensures that invalid emails are rejected at domain level."""
        with pytest.raises(ValueError, match="Incorrect email address"):
            UserEmail.from_string("invalid-email")

    def test_password_should_enforce_complexity(self) -> None:
        """
        Validates the password security policy:
        - Min 8 chars
        - Upper & Lower case
        - Numbers & Symbols
        """
        invalid_passwords = [
            "short",  # Too short
            "nonumbers!!",  # No digits
            "NoSymbols123",  # No special chars
            "ONLYUPPER123!",  # No lowercase
        ]

        for pwd in invalid_passwords:
            with pytest.raises(ValueError):
                UserPassword.from_str(pwd)

    def test_password_should_accept_valid_format(self) -> None:
        valid_pwd = "SecurePassword123!"
        vo = UserPassword.from_str(valid_pwd)
        assert vo.value == valid_pwd

    def test_username_should_enforce_length_constraints(self) -> None:
        """
        Validates min/max length for UserName.
        """
        from users.domain.value_objects.user_username import UserName

        # Too short
        with pytest.raises(ValueError, match="lower than 3"):
            UserName("ab")

        # Too long (51 chars)
        long_name = "a" * 51
        with pytest.raises(ValueError, match="longer than 50"):
            UserName(long_name)

    def test_username_should_reject_special_characters(self) -> None:
        """
        Security: Validates that username only accepts alphanumeric, dot, underscore,
         hyphen.
        This prevents SQL Injection payloads like "' OR 1=1" from entering the system.
        """
        from users.domain.value_objects.user_username import UserName

        invalid_payloads = [
            "user name",  # Space
            "user@name",  # @ symbol (should be email)
            "admin'--",  # SQLi
            "<script>",  # XSS
            "user/name",  # Path traversal char
        ]

        for payload in invalid_payloads:
            with pytest.raises(
                ValueError, match="Username contains invalid characters"
            ):
                UserName(payload)


class TestUserRoleVO:
    def test_should_accept_valid_roles(self) -> None:
        # Standard system roles
        assert UserRole("admin").value == "admin"
        # Dynamic roles (snake_case)
        assert UserRole("senior_auditor").value == "senior_auditor"

    def test_should_reject_invalid_formats(self) -> None:
        invalid_roles = [
            "Admin User",  # Espacios
            "super-admin",  # Guiones medios
            "a",  # Muy corto
            "123_role",  # Números al inicio (nuestro regex permite esto, verifiquemos)
            "admin!",  # Caracteres especiales
        ]

        for role in invalid_roles:
            with pytest.raises(ValueError):
                UserRole(role)

    def test_equality_logic(self) -> None:
        """Verifica que el objeto se pueda comparar con strings directamente."""
        role = UserRole("admin")
        assert role == "admin"
        assert role == UserRole("admin")
        assert role != "viewer"
