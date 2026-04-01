from types import TracebackType
from typing import Self

from sqlalchemy.orm import Session

from shared.infrastructure.persistence.database import SessionLocal


class UnitOfWork:
    """Coordinates the persistence of multiple repositories in a single transaction."""

    def __init__(self) -> None:
        self.session: Session = SessionLocal()

    def __enter__(self) -> Self:
        return self

    def __exit__(
        self,
        exc_type: type[BaseException] | None,
        exc_val: BaseException | None,
        exc_tb: TracebackType | None,
    ) -> None:
        if exc_type:
            self.rollback()
        else:
            self.commit()
        self.session.close()

    def commit(self) -> None:
        self.session.commit()

    def rollback(self) -> None:
        self.session.rollback()


# <<< END TYPING DRILL >>>
