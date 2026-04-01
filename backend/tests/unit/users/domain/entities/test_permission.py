from users.domain.entities.permission import Permission
from users.domain.value_objects.permission_name import PermissionName


class TestPermissionEntity:
    """
    Suite for Permission Domain Entity.
    Ensures structural integrity and BaseEntity inheritance.
    """

    def test_permission_should_instantiate_with_correct_attributes(self) -> None:
        # Arrange
        p_id = 101
        p_name = PermissionName.from_string("SALES_REPORT_VIEW")
        p_resource = "reports"
        p_desc = "Allows viewing of financial sales reports"

        # Act
        permission = Permission(
            permission_id=p_id, name=p_name, resource=p_resource, description=p_desc
        )

        # Assert
        assert permission.id == p_id
        assert permission.name.value == "SALES_REPORT_VIEW"
        assert permission.resource == p_resource
        assert permission.description == p_desc
        # Inherited from BaseEntity
        assert permission.created_at is not None
        assert permission.updated_at is not None
