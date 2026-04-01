"""Permission domain entity.

This module defines the Permission entity, representing a granular capability
or privilege within the system's security model.
"""

from shared.domain.entity import BaseEntity
from users.domain.value_objects.permission_name import PermissionName


class Permission(BaseEntity):
    """Aggregate root for System Permissions.

    Attributes:
        _id: Internal database identifier (int).
        _name: Unique functional identifier (PermissionName).
        _description: Human-readable explanation.
        _resource: The system resource this permission targets (e.g., 'inventory').
    """

    def __init__(
        self,
        permission_id: int,
        name: PermissionName,
        resource: str,
        description: str = "",
    ) -> None:
        """Initialize a new Permission entity."""
        super().__init__()
        self._id = permission_id
        self._name = name
        self._resource = resource
        self._description = description

    @property
    def id(self) -> int:
        """Return the internal ID."""
        return self._id

    @property
    def name(self) -> PermissionName:
        """Return the permission unique name."""
        return self._name

    @property
    def resource(self) -> str:
        """Return the target resource."""
        return self._resource

    @property
    def description(self) -> str:
        """Return the description."""
        return self._description
