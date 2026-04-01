import pytest

from users.domain.value_objects.permission_name import PermissionName


@pytest.mark.parametrize(
    "valid_input",
    ["USERS_READ", "INVENTORY_MANAGEMENT_ACCESS", "HEALTH_METRICS_V3_VIEW"],
)
def test_should_accept_valid_upper_snake_case(valid_input: str) -> None:
    """
    Ensures standard naming conventions are correctly parsed into the VO.
    """
    vo = PermissionName.from_string(valid_input)
    assert vo.value == valid_input
