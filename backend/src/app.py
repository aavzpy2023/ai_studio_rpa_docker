"""FastAPI application entry point.

This module initializes and configures the FastAPI application with all necessary
middleware, routers, dependency injection, and security rate limiting.
"""

import os
from collections.abc import AsyncIterator, Awaitable, Callable
from contextlib import asynccontextmanager

from fastapi import FastAPI, Request, Response
from fastapi.middleware.cors import CORSMiddleware
from kink import di
from slowapi import _rate_limit_exceeded_handler
from slowapi.errors import RateLimitExceeded

# --- MODULE IMPORTS ---
import users.infrastructure.driving.api.controller as users_api
from accounts.infrastructure.driving.api.controller import account_router
from chat.infrastructure.driving.api.controller import router as chat_router
from infrastructure.config.container import Container
from infrastructure.config.limiter import limiter
from shared.infrastructure.middleware.audit_middleware import AuditMiddleware
from shared.infrastructure.middleware.db_session_middleware import DBSessionMiddleware
from users.domain.repositories.user_repo import UserRepository
from users.infrastructure.driving.api.permission_scanner import PermissionScanner

# Initialize dependency injection container and bootstrap resources
Container.init_resources()


@asynccontextmanager
async def lifespan(app: FastAPI) -> AsyncIterator[None]:
    """
    Application Lifecycle Manager.
    Replaces deprecated @app.on_event("startup").
    """
    """
    Application Lifecycle Manager.
    Replaces deprecated @app.on_event("startup").
    """
    # Permission Auto-Discovery (Code-First IAM)
    try:
        # Repository access via DI
        repo = di[UserRepository]  # type: ignore[type-abstract]
        scanner = PermissionScanner()

        permissions = scanner.scan(app)
        inserted, granted = repo.sync_permissions(permissions)

        if inserted > 0:
            print(
                f"[IAM] 🛡️  Auto-Discovery: Inserted {inserted} new permissions."
                f" Granted {granted} to Admin."
            )
    except Exception as e:
        print(f"[IAM] ⚠️  Permission Sync Failed (Non-blocking): {e}")

    yield
    # Shutdown logic would go here if needed


# Create FastAPI application instance with metadata and lifespan
app = FastAPI(
    title="AI Assistant API",
    description="Hexagonal Architecture Modular API",
    version="1.0.0",
    lifespan=lifespan,
)


@app.middleware("http")
async def add_security_headers(
    request: Request, call_next: Callable[[Request], Awaitable[Response]]
) -> Response:
    """
    Applies defense-in-depth headers to prevent common web attacks.
    """
    response = await call_next(request)

    # Force browsers to strictly adhere to MIME types (Prevent Sniffing)
    response.headers["X-Content-Type-Options"] = "nosniff"
    # Prevent the site from being framed (Prevent Clickjacking)
    response.headers["X-Frame-Options"] = "DENY"
    # Enable XSS protection filter in legacy browsers
    response.headers["X-XSS-Protection"] = "1; mode=block"
    # Strict Transport Security (HSTS) - Force HTTPS for 1 year (Production only)
    if os.getenv("ENVIRONMENT") == "production":
        response.headers["Strict-Transport-Security"] = (
            "max-age=31536000; includeSubDomains"
        )

    return response


# --- SECURITY: RATE LIMITING ---
# Register the shared limiter state
app.state.limiter = limiter


# Register Exception Handler with Type Compatibility Fix
@app.exception_handler(RateLimitExceeded)
async def custom_rate_limit_exceeded_handler(
    request: Request, exc: RateLimitExceeded
) -> Response:
    """
    Wrapper to handle RateLimitExceeded exceptions.
    Delegates to slowapi's default handler but satisfies FastAPI's strict type checking.
    """
    return _rate_limit_exceeded_handler(request, exc)


app.add_middleware(AuditMiddleware)
app.add_middleware(DBSessionMiddleware)

# --- MIDDLEWARE: CORS ---
# Configure CORS for cross-origin requests
# origins = [
#     "http://localhost",  # React default
#     "http://127.0.0.1",
#     "http://127.0.0.1:3000",
# ]

# Dynamic CORS Loading: Allows flexibility for Docker/Production domains
cors_env = os.getenv("CORS_ORIGINS", "http://localhost:3000,http://127.0.0.1:3000")
origins = [origin.strip() for origin in cors_env.split(",")]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# --- ROUTER REGISTRATION ---
# Wrap all business routers with a global '/api' prefix
app.include_router(users_api.auth_router, prefix="/api")
app.include_router(users_api.user_router, prefix="/api")
app.include_router(account_router, prefix="/api")
app.include_router(chat_router, prefix="/api")


@app.get("/health")
def health_check() -> dict[str, str]:
    """Health check endpoint for monitoring and load balancers.

    Returns:
        Dictionary with system status information.
    """
    return {"status": "operational", "system": "Hexagonal AI Assistant"}


# --- MIDDLEWARE: DB SESSION MANAGEMENT ---
@app.middleware("http")
async def validate_origin_header(
    request: Request, call_next: Callable[[Request], Awaitable[Response]]
) -> Response:
    """
    Extra layer of protection for state-changing requests.
    Validates that the Origin header (if present) is in the allowed whitelist.
    """
    if request.method in ("POST", "PUT", "PATCH", "DELETE"):
        origin = request.headers.get("origin")
        if origin and origin not in origins:
            from fastapi.responses import JSONResponse

            return JSONResponse(
                status_code=403,
                content={"detail": f"CSRF Breach: Origin '{origin}' not allowed."},
            )
    return await call_next(request)
