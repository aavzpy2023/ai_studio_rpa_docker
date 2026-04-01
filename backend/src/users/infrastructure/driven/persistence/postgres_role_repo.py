from datetime import UTC, datetime

from sqlalchemy import delete, select
from sqlalchemy.orm import Session

from users.domain.entities.permission import Permission
from users.domain.repositories.role_repo import RoleRepository
from users.domain.value_objects.permission_name import PermissionName
from users.domain.value_objects.user_role import UserRole
from users.infrastructure.driven.persistence.role_model import RoleModel


class PostgresRoleRepository(RoleRepository):
    """
    PostgreSQL adapter for Role persistence.
    """

    def __init__(self, session: Session):
        self.session = session

    def save(self, role_name: UserRole, is_system: bool = False) -> None:
        now_ts = datetime.now(UTC)
        model = RoleModel(
            role=role_name.value,
            is_system=is_system,
            created_at=now_ts,
            updated_at=now_ts,
        )
        self.session.add(model)
        self.session.commit()

    def delete(self, role_name: UserRole) -> None:
        stmt = delete(RoleModel).where(RoleModel.role == role_name.value)
        self.session.execute(stmt)
        self.session.commit()

    def exists(self, role_name: UserRole) -> bool:
        stmt = select(RoleModel.id).where(RoleModel.role == role_name.value)
        return self.session.execute(stmt).scalar_one_or_none() is not None

    def get_system_status(self, role_name: UserRole) -> bool:
        stmt = select(RoleModel.is_system).where(RoleModel.role == role_name.value)
        # Default to False if not found (though use case handles not found)
        return self.session.execute(stmt).scalar_one_or_none() or False

    def get_role_permissions(self, role_name: UserRole) -> list[Permission]:
        stmt = select(RoleModel).where(RoleModel.role == role_name.value)
        model = self.session.execute(stmt).scalar_one_or_none()

        if not model:
            return []

        return [
            Permission(
                permission_id=p.id,
                name=PermissionName(p.name),
                resource=p.resource,
                description=p.description or "",
            )
            for p in model.permissions
        ]
