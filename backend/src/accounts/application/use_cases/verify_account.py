import uuid
from typing import Any

from kink import inject
from pydantic import BaseModel, ConfigDict

from accounts.domain.repositories.account_repo import AccountRepository
from browser.domain.ports.browser_manager_port import BrowserManagerPort


class VerifyAccountDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    account_id: str


@inject
class VerifyAccountUseCase:
    """Use case to verify if an account session is successfully authenticated."""

    def __init__(
        self, account_repo: AccountRepository, browser_manager: BrowserManagerPort
    ) -> None:
        self.account_repo = account_repo
        self.browser_manager = browser_manager

    async def execute(self, dto: VerifyAccountDTO) -> dict[str, Any]:
        account_uuid = uuid.UUID(dto.account_id)
        account = self.account_repo.get_by_id(account_uuid)

        if not account:
            raise ValueError(f"Account with ID {dto.account_id} not found.")

        is_verified = await self.browser_manager.verify_and_save_auth(str(account.id))

        if is_verified:
            account.status = "available"
            self.account_repo.save(account)

        return {
            "success": is_verified,
            "status": account.status,
            "message": "Autenticación exitosa."
            if is_verified
            else "Fallo en verificación. ¿Completaste el login en la ventana VNC?",
        }
