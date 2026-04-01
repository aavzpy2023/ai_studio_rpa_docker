import uuid
from typing import Any

from kink import inject
from pydantic import BaseModel, ConfigDict

from accounts.domain.repositories.account_repo import AccountRepository
from browser.domain.ports.browser_manager_port import BrowserManagerPort


class StopBootstrapAccountDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    account_id: str


@inject
class StopBootstrapAccountUseCase:
    """Use case to abort the manual authentication process for an account."""

    def __init__(
        self, account_repo: AccountRepository, browser_manager: BrowserManagerPort
    ) -> None:
        self.account_repo = account_repo
        self.browser_manager = browser_manager

    async def execute(self, dto: StopBootstrapAccountDTO) -> dict[str, Any]:
        account_uuid = uuid.UUID(dto.account_id)
        account = self.account_repo.get_by_id(account_uuid)

        if not account:
            raise ValueError(f"Account with ID {dto.account_id} not found.")

        # Abort any pending manual auth browser
        await self.browser_manager.abort_auth(str(account.id))

        # Revert status to requires_auth
        account.status = "requires_auth"
        self.account_repo.save(account)

        return {
            "status": account.status,
            "message": "Bootstrap process aborted.",
        }
