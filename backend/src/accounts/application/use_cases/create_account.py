import uuid

from kink import inject
from pydantic import BaseModel, ConfigDict

from accounts.domain.entities.account import Account
from accounts.domain.repositories.account_repo import AccountRepository
from shared.infrastructure.persistence.unit_of_work import UnitOfWork


class CreateAccountDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    email: str


@inject
class CreateAccountUseCase:
    def __init__(self, repo: AccountRepository, uow: UnitOfWork):
        self.repo = repo
        self.uow = uow

    def execute(self, dto: CreateAccountDTO) -> Account:
        with self.uow as uow:
            new_account = Account(
                id=uuid.uuid4(),
                email=dto.email,
                status="requires_auth",
                detected_limit=0,
            )
            self.repo.save(new_account)
            uow.commit()
            return new_account
