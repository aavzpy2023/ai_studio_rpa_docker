from fastapi import Request, Response
from kink import di
from sqlalchemy.orm import scoped_session
from starlette.middleware.base import BaseHTTPMiddleware, RequestResponseEndpoint


class DBSessionMiddleware(BaseHTTPMiddleware):
    """
    Middleware to ensure SQLAlchemy sessions are cleaned up after every request.
    This prevents 'InFailedSqlTransaction' errors from leaking across requests
    when using thread-local scoped_sessions.
    """

    async def dispatch(
        self, request: Request, call_next: RequestResponseEndpoint
    ) -> Response:
        try:
            response = await call_next(request)
            return response
        except Exception as e:
            # If an unhandled exception occurred, ensure we don't commit anything
            # The session will be removed in finally, which rolls back uncommitted
            raise e
        finally:
            # CRITICAL: Return connection to pool and rollback uncommitted transactions
            if scoped_session in di:
                di[scoped_session].remove()
