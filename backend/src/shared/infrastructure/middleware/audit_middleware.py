"""
Middleware for HTTP Request/Response auditing.
Captures metadata, latency, and actor identity for security monitoring.
"""

import logging
import time
from collections.abc import Callable
from typing import cast

import jwt
from fastapi import Request, Response
from starlette.middleware.base import BaseHTTPMiddleware

# Configure a specific logger for audit trails
audit_logger = logging.getLogger("audit")
audit_logger.setLevel(logging.INFO)
handler = logging.StreamHandler()
handler.setFormatter(
    logging.Formatter("[AUDIT] %(asctime)s | %(levelname)s | %(message)s")
)
audit_logger.addHandler(handler)


class AuditMiddleware(BaseHTTPMiddleware):
    """
    Intercepts all HTTP requests to log execution details.
    Attempts to identify the actor via JWT without enforcing auth logic.
    """

    async def dispatch(
        self, request: Request, call_next: Callable[[Request], object]
    ) -> Response:
        start_time = time.perf_counter()

        # 1. Capture Identity (Best Effort)
        actor_id = "anonymous"
        auth_header = request.headers.get("Authorization")
        if auth_header and auth_header.startswith("Bearer "):
            try:
                token = auth_header.split(" ")[1]
                # Decode without verifying signature just to extract 'sub' for logging.
                # Security verification happens in the actual endpoint dependencies.
                payload = jwt.decode(token, options={"verify_signature": False})
                actor_id = payload.get("sub", "unknown")
            except Exception:
                actor_id = "invalid_token"

        # 2. Process Request
        try:
            # We await the response from the next handler in the chain
            # The type hint for call_next implies it returns an Awaitable[Response]
            response = await call_next(request)  # type: ignore

            process_time = (time.perf_counter() - start_time) * 1000

            # 3. Log Outcome
            self._log_interaction(
                actor=actor_id,
                method=request.method,
                path=request.url.path,
                status=response.status_code,
                latency_ms=process_time,
                client_ip=request.client.host if request.client else "0.0.0.0",
            )

            return cast(Response, response)

        except Exception as e:
            # Log critical failures that crash the application
            process_time = (time.perf_counter() - start_time) * 1000
            audit_logger.error(
                f"CRITICAL | Actor: {actor_id} | {request.method} {request.url.path} | "
                f"Error: {str(e)} | Latency: {process_time:.2f}ms"
            )
            raise e

    def _log_interaction(
        self,
        actor: str,
        method: str,
        path: str,
        status: int,
        latency_ms: float,
        client_ip: str,
    ) -> None:
        """Writes the structured audit log."""
        # Skip health checks to reduce noise
        if path == "/health":
            return

        level = logging.INFO if status < 400 else logging.WARNING
        audit_logger.log(
            level,
            f"Actor: {actor} | IP: {client_ip} | {method} {path} | "
            f"Status: {status} | Latency: {latency_ms:.2f}ms",
        )
