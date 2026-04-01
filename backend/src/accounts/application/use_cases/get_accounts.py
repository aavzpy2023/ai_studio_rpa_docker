from kink import inject

from accounts.domain.entities.account import Account
from accounts.domain.repositories.account_repo import AccountRepository


@inject
class GetAccountsUseCase:
    def __init__(self, repo: AccountRepository):
        self.repo = repo

    def execute(self) -> list[Account]:
        return self.repo.get_all()
