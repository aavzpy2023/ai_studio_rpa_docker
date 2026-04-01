import uuid

from pydantic import BaseModel, ConfigDict


class SendMessageRequestDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    account_id: str
    message: str


class DirectMessageRequestDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    account_id: str
    context: str = ""
    message: str


class DirectMessageResponseDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    content: str


class MessageResponseDTO(BaseModel):
    model_config = ConfigDict(strict=True, extra="forbid")
    id: uuid.UUID
    conversation_id: uuid.UUID
    role: str
    content: str
