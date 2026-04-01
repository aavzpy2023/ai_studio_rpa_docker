import pytest

from users.domain.value_objects.permission_name import PermissionName


class TestValidationFailures:
    """Tests how the domain reacts to malformed or malicious input strings."""

    def test_should_reject_lowercase(self) -> None:
        with pytest.raises(ValueError, match="Must be UPPER_SNAKE_CASE"):
            PermissionName.from_string("users_read")

    def test_should_reject_starting_with_digit(self) -> None:
        with pytest.raises(ValueError, match="Invalid permission format"):
            PermissionName.from_string("1_READ_ONLY")

    def test_should_reject_empty_or_whitespace(self) -> None:
        with pytest.raises(ValueError, match="cannot be empty"):
            PermissionName.from_string("")
