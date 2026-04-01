from datetime import datetime

from sqlalchemy import Boolean, DateTime, ForeignKey, Integer, String
from sqlalchemy.orm import Mapped, mapped_column

from shared.infrastructure.persistence.database import Base


class UserModel(Base):
    """
    SQLAlchemy ORM model for the users table.

    This model represents the database schema for user data persistence.
    It defines the structure, constraints, and indexes for the users table
    in PostgreSQL.

    The model uses SQLAlchemy 2.0 style with Mapped types for better type safety
    and IDE support. Key features include:
    - UUID-based primary key (stored as string)
    - Unique constraints on username and email with indexes for fast lookups
    - Automatic timestamp management for created_at and updated_at
    - Role-based access control with default 'user' role

    Attributes:
        id: Unique identifier (UUID as string), primary key.
        username: Unique username, indexed for fast lookups.
        email: Unique email address, indexed for authentication.
        hashed_password: Bcrypt hashed password (never store plaintext).
        firstname: User's first name.
        lastname: User's last name.
        middname: User's middle name (optional, nullable).
        phone: User's phone number.
        role: User's role in the system (default: 'user').
        created_at: Timestamp when the user was created (auto-set).
        updated_at: Timestamp when the user was last modified (auto-updated).
    """

    __tablename__ = "dff_users"

    # Primary key: UUID stored as string (36 characters)
    id: Mapped[int] = mapped_column(Integer, primary_key=True, autoincrement=True)

    # Core Identity
    username: Mapped[str] = mapped_column(String(50), unique=True, index=True)
    email: Mapped[str] = mapped_column(String(250), unique=True, index=True)

    # Password: Mapped to legacy column 'password' but holds the Hash
    hashed_password: Mapped[str] = mapped_column("password", String(255))

    # Personal Info
    firstname: Mapped[str] = mapped_column(String(100), nullable=False)
    lastname: Mapped[str] = mapped_column(String(150), nullable=False)
    middname: Mapped[str | None] = mapped_column(String(100), nullable=True)

    # Legacy specific fields
    movil: Mapped[str | None] = mapped_column(String(11), nullable=True)
    phone: Mapped[str | None] = mapped_column("Phone", String(11), nullable=True)

    # Role Mapping: DB uses integer FK (id_role), Domain uses string
    id_role: Mapped[int] = mapped_column(
        Integer, ForeignKey("dff_role.id"), nullable=True, default=2, index=True
    )

    # Status
    active: Mapped[bool] = mapped_column(Boolean, default=True)

    # Security & Audit (Added via Migration Script)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=False))
    updated_at: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True), nullable=True
    )
    failed_attempts: Mapped[int] = mapped_column(Integer, default=0)
    lockout_until: Mapped[datetime | None] = mapped_column(
        DateTime(timezone=True), nullable=True
    )
    session_id: Mapped[str | None] = mapped_column(String(36), nullable=True)
