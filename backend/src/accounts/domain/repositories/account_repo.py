import uuid
from abc import ABC, abstractmethod

from accounts.domain.entities.account import Account


class AccountRepository(ABC):
    @abstractmethod
    def acquire_lock(self, account_id: uuid.UUID) -> Account | None:
        """
        Acquires a pessimistic lock (SELECT FOR UPDATE) on the account
        row to prevent
        filesystem corruption during concurrent operations on the
        /data/profiles/ directory.
        """
        pass

    @abstractmethod
    def save(self, account: Account) -> None:
        pass

    @abstractmethod
    def get_all(self) -> list[Account]:
        pass

    @abstractmethod
    def get_by_id(self, account_id: uuid.UUID) -> Account | None:
        pass
