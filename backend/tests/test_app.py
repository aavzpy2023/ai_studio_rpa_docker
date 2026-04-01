import pytest
from fastapi import status
from httpx import ASGITransport, AsyncClient

from app import app

# Marca todas las pruebas en este archivo para usar asyncio
pytestmark = pytest.mark.asyncio


async def test_health_check_returns_ok() -> None:
    """
    Test de Humo (Smoke Test):
    Verifica que la API está viva y el endpoint /health responde correctamente.
    """
    # Usamos ASGITransport  para evitar warnings de deprecación recientes
    # de httpx/fastapi
    async with AsyncClient(
        transport=ASGITransport(app=app), base_url="http://test"
    ) as client:
        response = await client.get("/health")

    assert response.status_code == status.HTTP_200_OK
    assert response.json() == {
        "status": "operational",
        "system": "Hexagonal AI Assistant",
    }
