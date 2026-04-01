import uuid

from sqlalchemy.orm import Session

from accounts.domain.entities.account import Account
from accounts.domain.repositories.account_repo import AccountRepository
from accounts.infrastructure.driven.persistence.account_model import AccountModel


class PostgresAccountRepository(AccountRepository):
    def __init__(self, session: Session):
        self._session = session

    def _to_domain(self, model: AccountModel) -> Account:
        return Account(
            id=model.id,
            email=model.email,
            status=model.status,
            detected_limit=model.detected_limit,
            session_file=model.session_file,
        )

    def _to_orm(self, domain: Account) -> AccountModel:
        return AccountModel(
            id=domain.id,
            email=domain.email,
            status=domain.status,
            detected_limit=domain.detected_limit,
            session_file=domain.session_file,
        )

    def acquire_lock(self, account_id: uuid.UUID) -> Account | None:
        try:
            # Cure any poisoned session inherited from the thread pool
            self._session.rollback()
            model = (
                self._session.query(AccountModel)
                .with_for_update(skip_locked=True)
                .filter_by(id=account_id)
                .first()
            )
            if not model:
                self._session.commit()
                return None
            return self._to_domain(model)
        except Exception:
            self._session.rollback()
            raise

    def save(self, account: Account) -> None:
        try:
            model = self._session.query(AccountModel).filter_by(id=account.id).first()
            if model:
                model.email = account.email
                model.status = account.status
                model.detected_limit = account.detected_limit
                model.session_file = account.session_file
            else:
                new_model = self._to_orm(account)
                self._session.add(new_model)
            # Upgrade flush to commit to ensure persistence and lock release
            self._session.commit()
        except Exception:
            self._session.rollback()
            raise

    def get_all(self) -> list[Account]:
        try:
            # Defensive sanitize
            self._session.rollback()
            models = self._session.query(AccountModel).all()
            return [self._to_domain(m) for m in models]
        except Exception:
            self._session.rollback()
            raise

    def get_by_id(self, account_id: uuid.UUID) -> Account | None:
        try:
            # Defensive sanitize
            self._session.rollback()
            model = self._session.query(AccountModel).filter_by(id=account_id).first()
            if not model:
                return None
            return self._to_domain(model)
        except Exception:
            self._session.rollback()
            raise
