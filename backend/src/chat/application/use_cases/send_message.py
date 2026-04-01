import uuid

from kink import inject
from sqlalchemy.orm import scoped_session

from accounts.infrastructure.driven.persistence.account_model import AccountModel
from browser.domain.exceptions import AccountAuthError
from browser.domain.ports.ai_studio_port import AIStudioPort
from chat.application.dtos import (
    DirectMessageRequestDTO,
    DirectMessageResponseDTO,
    MessageResponseDTO,
    SendMessageRequestDTO,
)
from chat.domain.exceptions import BrowserDomainError
from chat.infrastructure.driven.persistence.message_model import MessageModel


@inject
class SendDirectMessageUseCase:
    """[ID-1.1.3] Sends a direct message to AI Studio, injecting model selection and context.
    """

    def __init__(self, ai_studio: AIStudioPort):
        self._ai_studio = ai_studio

    async def execute(self, req: DirectMessageRequestDTO) -> DirectMessageResponseDTO:
        try:
            print(f"[CHAT] 🚀 Enviando mensaje al modelo: '{req.message}'")
            if req.context.strip():
                full_prompt = f"CONTEXT:\n{req.context}\n\nPROMPT:\n{req.message}"
            else:
                full_prompt = req.message
                
            ai_response_text = await self._ai_studio.send_prompt(req.account_id, full_prompt)
            return DirectMessageResponseDTO(content=ai_response_text)
        except Exception as e:
            raise BrowserDomainError(f"Failed to orchestrate direct message: {str(e)}") from e


@inject
class SendMessageUseCase:
    """
    [ID-3.2.1] Orchestrates sending a message to the AI Studio browser session.
    """

    def __init__(self, session: scoped_session, ai_studio: AIStudioPort):
        self._session = session
        self._ai_studio = ai_studio

    async def execute(
        self, conversation_id: uuid.UUID, req: SendMessageRequestDTO
    ) -> MessageResponseDTO:
        # 1. Save User Message
        user_msg = MessageModel(
            conversation_id=conversation_id, role="user", content=req.message
        )
        self._session.add(user_msg)
        self._session.commit()

        # 2. Send to AI Studio
        print(f"[CHAT] 🚀 Enviando mensaje al modelo: '{req.message}'")
        try:
            ai_response_text = await self._ai_studio.send_prompt(
                req.account_id, req.message
            )
        except AccountAuthError as e:
            account = self._session.query(AccountModel).filter_by(id=req.account_id).first()
            if account:
                account.status = "requires_auth"
                self._session.commit()
            raise AccountAuthError("Account disconnected. Re-authenticate via VNC.") from e

        # 3. Save Assistant Message
        assistant_msg = MessageModel(
            conversation_id=conversation_id, role="assistant", content=ai_response_text
        )
        self._session.add(assistant_msg)
        self._session.commit()
        self._session.refresh(assistant_msg)

        return MessageResponseDTO(
            id=assistant_msg.id,
            conversation_id=assistant_msg.conversation_id,
            role=assistant_msg.role,
            content=assistant_msg.content,
        )
