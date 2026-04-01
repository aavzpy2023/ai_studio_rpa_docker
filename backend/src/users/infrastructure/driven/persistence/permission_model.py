from datetime import datetime

from sqlalchemy import Column, DateTime, ForeignKey, Integer, String, Table
from sqlalchemy.orm import Mapped, mapped_column

from shared.infrastructure.persistence.database import Base

role_permission_association = Table(
    "dff_role_permission",  # table to search in the DB
    Base.metadata,  # For table register in the table's book of DB
    Column("id_role", Integer, ForeignKey("dff_role.id"), primary_key=True),
    Column("id_permission", Integer, ForeignKey("dff_permission.id"), primary_key=True),
    extend_existing=True,
)


class PermissionModel(Base):
    """
    SQLAlchemy ORM model for system permissions.
    Maps to table 'dff_permission'.
    """

    __tablename__ = "dff_permission"

    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)
    name: Mapped[str] = mapped_column(
        String(100), unique=True, nullable=False, index=True
    )
    description: Mapped[str | None] = mapped_column(String(255), nullable=True)
    resource: Mapped[str] = mapped_column(String(50), nullable=False)

    # datetime from python and DateTime from sqlalchemy
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True))
    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True), nullable=True
    )
