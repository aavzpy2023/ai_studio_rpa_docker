from typing import Any

from users.domain.entities.user import User


def test_user_identity_consistency(valid_user_params: dict[str, Any]) -> None:
    """
    Validates that the User entity's identity is strictly tied to its UserID.

    In DDD, an entity is defined by its identity rather than its attributes.
    This test ensures the identity remains constant and accessible.
    """
    print(valid_user_params)
    user = User(**valid_user_params)
    expected_uuid = "550e8400-e29b-41d4-a716-446655440000"

    # Identity verification  through the Value Object wrapper
    assert user._id.value == expected_uuid
