from typing import Any

from fastapi import APIRouter, HTTPException
from kink import di
from sqlalchemy.exc import IntegrityError

from accounts.application.use_cases.bootstrap_account import (
    BootstrapAccountDTO,
    BootstrapAccountUseCase,
)
from accounts.application.use_cases.create_account import (
    CreateAccountDTO,
    CreateAccountUseCase,
)
from accounts.application.use_cases.get_accounts import GetAccountsUseCase
from accounts.application.use_cases.stop_bootstrap_account import (
    StopBootstrapAccountDTO,
    StopBootstrapAccountUseCase,
)
from accounts.application.use_cases.verify_account import (
    VerifyAccountDTO,
    VerifyAccountUseCase,
)

account_router = APIRouter(tags=["Accounts"])


@account_router.post("/accounts")
def create_account(dto: CreateAccountDTO) -> dict[str, Any]:
    try:
        use_case = di[CreateAccountUseCase]
        account = use_case.execute(dto)
        return {
            "id": str(account.id),
            "email": account.email,
            "status": account.status,
            "detected_limit": account.detected_limit,
            "session_file": account.session_file,
        }
    except IntegrityError as err:
        raise HTTPException(
            status_code=400, detail="An account with this email already exists."
        ) from err
    except Exception as err:
        raise HTTPException(status_code=500, detail=str(err)) from err


@account_router.get("/accounts")
def get_accounts() -> list[dict[str, Any]]:
    use_case = di[GetAccountsUseCase]
    accounts = use_case.execute()
    return [
        {
            "id": str(a.id),
            "email": a.email,
            "status": a.status,
            "detected_limit": a.detected_limit,
            "session_file": a.session_file,
        }
        for a in accounts
    ]


@account_router.post("/accounts/{account_id}/bootstrap")
async def bootstrap_account(account_id: str) -> dict[str, Any]:
    try:
        use_case = di[BootstrapAccountUseCase]
        return await use_case.execute(BootstrapAccountDTO(account_id=account_id))
    except ValueError as err:
        raise HTTPException(status_code=404, detail=str(err)) from err
    except Exception as err:
        raise HTTPException(status_code=500, detail=str(err)) from err


@account_router.delete("/accounts/{account_id}/bootstrap")
async def stop_bootstrap_account(account_id: str) -> dict[str, Any]:
    try:
        use_case = di[StopBootstrapAccountUseCase]
        return await use_case.execute(StopBootstrapAccountDTO(account_id=account_id))
    except ValueError as err:
        raise HTTPException(status_code=404, detail=str(err)) from err
    except Exception as err:
        raise HTTPException(status_code=500, detail=str(err)) from err


@account_router.post("/accounts/{account_id}/verify")
async def verify_account(account_id: str) -> dict[str, Any]:
    try:
        use_case = di[VerifyAccountUseCase]
        return await use_case.execute(VerifyAccountDTO(account_id=account_id))
    except ValueError as err:
        raise HTTPException(status_code=404, detail=str(err)) from err
    except Exception as err:
        raise HTTPException(status_code=500, detail=str(err)) from err
