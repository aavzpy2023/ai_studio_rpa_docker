import uuid
from datetime import UTC, datetime

from sqlalchemy import DateTime, Integer, String
from sqlalchemy.orm import Mapped, mapped_column

from shared.infrastructure.persistence.database import Base


class AccountModel(Base):
    __tablename__ = "accounts"

    id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)
    email: Mapped[str] = mapped_column(String(255), unique=True, nullable=False)
    status: Mapped[str] = mapped_column(
        String(50),
        nullable=False,
        default="requires_auth",
        comment=(
            "State machine: 'available', 'in_use', 'limit_reached', "
            "'requires_auth', 'ready'."
        ),
    )
    detected_limit: Mapped[int] = mapped_column(
        Integer,
        nullable=False,
        default=0,
        comment=(
            "Dynamic heuristic tracking the maximum messages sent before hitting quota."
        ),
    )
    session_file: Mapped[str | None] = mapped_column(
        String(255),
        nullable=True,
        comment="Path to the Playwright storage_state JSON file. Ensures 100% isolated cookies for headless contexts.",
    )
    created_at: Mapped[datetime] = mapped_column(
        DateTime(timezone=True),
        default=lambda: datetime.now(UTC),
        nullable=False,
    )
