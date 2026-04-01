# INSTRUCTION: Implement the missing logic using 'pyjwt'.
# SRP: This file ONLY knows how to talk to the JWT library.

from datetime import UTC, datetime, timedelta
from typing import Any

import jwt  # Ensure pyjwt is installed

from users.domain.services.security_services import TokenService


class JwtAdapter(TokenService):
    """
    JSON Web Token (JWT) implementation of the TokenService interface.
    """

    def __init__(self, secret_key: str, algorithm: str = "HS256") -> None:
        self.secret_key = secret_key
        self.algorithm = algorithm

    def create_access_token(
        self, data: dict[str, Any], expires_delta_minutes: int = 60
    ) -> str:
        to_encode = data.copy()
        expire = datetime.now(UTC) + timedelta(minutes=expires_delta_minutes)
        to_encode.update({"exp": expire})
        return jwt.encode(to_encode, self.secret_key, algorithm=self.algorithm)

    def create_refresh_token(
        self, data: dict[str, Any], expires_delta_days: int = 7
    ) -> str:
        to_encode = data.copy()
        expire = datetime.now(UTC) + timedelta(days=expires_delta_days)
        # Mark as 'refresh' to prevent usage as access token
        to_encode.update({"exp": expire, "type": "refresh"})
        return jwt.encode(to_encode, self.secret_key, algorithm=self.algorithm)

    def decode_access_token(self, token: str) -> dict[str, Any]:
        """
        Decodes the JWT using the secret key.
        Returns the payload if valid, otherwise raises jwt exceptions.
        """
        try:
            # NOTICE: pyjwt validates 'exp' automatically by default.
            payload: dict[str, Any] = jwt.decode(
                token, self.secret_key, algorithms=[self.algorithm]
            )
            return payload
        except jwt.ExpiredSignatureError as e:
            # Log this if needed
            raise ValueError("Token has expired") from e
        except jwt.InvalidTokenError as e:
            raise ValueError("Invalid authentication token") from e
