import uuid
from typing import Any

from kink import inject
from pydantic import BaseModel, ConfigDict

from accounts.domain.repositories.account_repo import AccountRepository
from browser.domain.ports.browser_manager_port import BrowserManagerPort


class BootstrapAccountDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    account_id: str


@inject
class BootstrapAccountUseCase:
    """Use case to start the bootstrap (VNC) process for an account."""

    def __init__(
        self, account_repo: AccountRepository, browser_manager: BrowserManagerPort
    ) -> None:
        self.account_repo = account_repo
        self.browser_manager = browser_manager

    async def execute(self, dto: BootstrapAccountDTO) -> dict[str, Any]:
        account_uuid = uuid.UUID(dto.account_id)
        account = self.account_repo.get_by_id(account_uuid)

        if not account:
            raise ValueError(f"Account with ID {dto.account_id} not found.")

        # Update status to indicate manual auth is pending (Chromium open)
        account.status = "activating"
        self.account_repo.save(account)

        # Start manual auth browser and get session file path
        session_file = await self.browser_manager.start_manual_auth(str(account.id))
        account.session_file = session_file
        self.account_repo.save(account)

        return {
            "status": account.status,
            "session_file": session_file,
            "message": "Conéctate por VNC para completar el inicio de sesión.",
        }
