import uuid

import pytest
from fastapi import status
from httpx import ASGITransport, AsyncClient
from sqlalchemy.orm import Session

from app import app


@pytest.mark.asyncio
async def test_complete_auth_flow(session: Session) -> None:
    """
    E2E flow test: Register -> Login -> Verify Permissions (RBAC).
    """
    # Generamos identidad única para evitar colisiones en DB persistente
    run_id = str(uuid.uuid4())[:8]
    username = f"user_{run_id}"
    email = f"test_{run_id}@example.com"

    async with AsyncClient(
        transport=ASGITransport(app=app), base_url="http://test"
    ) as ac:
        # 1. Register User
        reg_payload = {
            "firstname": "Integration",
            "lastname": "Test",
            "username": username,
            "email": email,
            "password": "IntegrationPassword123!",
            "phone": "99988877766",
        }
        reg_resp = await ac.post("/api/auth/register", json=reg_payload)

        # Debugging aid
        if reg_resp.status_code != status.HTTP_201_CREATED:
            print(f"\n[ERROR BODY]: {reg_resp.text}")

        assert reg_resp.status_code == status.HTTP_201_CREATED

        # VERIFICACIÓN INMEDIATA (Registro): El usuario ya debe tener permisos
        reg_data = reg_resp.json()
        assert "permissions" in reg_data
        # El rol 'viewer' tiene permisos de lectura básicos
        assert "SALES_READ" in reg_data["permissions"]

        # 2. Login User
        login_payload = {
            "identifier": email,
            "password": "IntegrationPassword123!",
        }
        login_resp = await ac.post("/api/auth/login", json=login_payload)

        # 3. Final Verification (Login)
        assert login_resp.status_code == status.HTTP_200_OK
        data = login_resp.json()

        assert "access_token" in data
        assert data["token_type"] == "bearer"

        user_obj = data["user"]
        assert user_obj["email"] == email
        assert user_obj["role"] == "viewer"
        assert "SALES_READ" in user_obj["permissions"]
