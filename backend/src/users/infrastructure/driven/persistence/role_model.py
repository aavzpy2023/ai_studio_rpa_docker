from datetime import datetime

from sqlalchemy import Boolean, DateTime, Integer, String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from shared.infrastructure.persistence.database import Base
from users.infrastructure.driven.persistence.permission_model import (
    PermissionModel,
    role_permission_association,
)


class RoleModel(Base):
    """
    SQLAlchemy ORM model for user roles.
    Maps to the legacy 'dff_rol' table.
    """

    __tablename__ = "dff_role"

    id: Mapped[int] = mapped_column(Integer, primary_key=True)
    role: Mapped[str] = mapped_column(String(50), unique=True, nullable=False)
    is_system: Mapped[bool] = mapped_column(Boolean, default=False, nullable=False)
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True), nullable=False
    )
    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True), nullable=True
    )

    # --- Relationship many to many through a pivot table PermissionModel
    # e.g. a role has many permissions

    permissions: Mapped[list[PermissionModel]] = relationship(
        secondary=role_permission_association,
        lazy="selectin",
    )
