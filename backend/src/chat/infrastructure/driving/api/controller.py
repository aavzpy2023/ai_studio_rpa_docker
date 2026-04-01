import uuid

from fastapi import APIRouter, HTTPException
from kink import di

from chat.application.dtos import (
    DirectMessageRequestDTO,
    DirectMessageResponseDTO,
    MessageResponseDTO,
    SendMessageRequestDTO,
)
from chat.application.use_cases.send_message import SendDirectMessageUseCase, SendMessageUseCase
from chat.domain.exceptions import BrowserDomainError

router = APIRouter(prefix="/conversations", tags=["Chat"])


@router.post("/direct", response_model=DirectMessageResponseDTO)
async def send_direct_message(req: DirectMessageRequestDTO) -> DirectMessageResponseDTO:
    """
    [ID-1.1.4] Sends a direct message with context and specific model selection.
    """
    use_case = di[SendDirectMessageUseCase]
    try:
        return await use_case.execute(req)
    except BrowserDomainError as e:
        raise HTTPException(status_code=500, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/{conversation_id}/messages", response_model=MessageResponseDTO)
async def send_message(
    conversation_id: uuid.UUID, req: SendMessageRequestDTO
) -> MessageResponseDTO:
    """
    [ID-3.2.2] Sends a message in a specific conversation via AI Studio.
    """
    use_case = di[SendMessageUseCase]
    try:
        return await use_case.execute(conversation_id, req)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
