"""Models registry — import all SQLAlchemy models to ensure Base.metadata is fully populated."""

from accounts.infrastructure.driven.persistence.account_model import (
    AccountModel,  # noqa: F401
)
