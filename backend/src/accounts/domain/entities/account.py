import uuid
from dataclasses import dataclass


@dataclass
class Account:
    id: uuid.UUID
    email: str
    status: str
    detected_limit: int
    session_file: str | None = None
