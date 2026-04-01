from datetime import UTC, datetime
from typing import Any

from users.domain.entities.user import User


def test_user_audit_fields_generation(valid_user_params: dict[str, Any]) -> None:
    """
    Verifies that the User entity inherits and initializes audit timestamps correctly.

    The User entity extends BaseEntity, which provides automatic creation and
    update timestamps for system traceability.
    """
    # Act
    user = User(**valid_user_params)

    # Assert: Check if  timestamps are properly initialized upon creation
    assert isinstance(user.created_at, datetime)
    assert isinstance(user.updated_at, datetime)

    # Temporal verification (allowing a small delta for execution time)
    now = datetime.now(UTC)

    assert (now - user.created_at).total_seconds() < 2.0
