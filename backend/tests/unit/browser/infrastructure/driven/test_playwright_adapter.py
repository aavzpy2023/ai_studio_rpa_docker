from unittest.mock import AsyncMock, patch

import pytest

from browser.domain.ports.file_system_port import FileSystemPort
from browser.infrastructure.driven.playwright_adapter import PlaywrightAdapter


@pytest.fixture
def mock_file_system() -> AsyncMock:
    return AsyncMock(spec=FileSystemPort)


@pytest.mark.asyncio
async def test_activate_and_deactivate_account(
    mock_file_system: AsyncMock,
) -> None:
    adapter = PlaywrightAdapter(file_system=mock_file_system, base_path="/tmp")

    mock_pw = AsyncMock()
    mock_browser_context = AsyncMock()
    mock_pw.chromium.launch_persistent_context.return_value = mock_browser_context

    with patch(
        "browser.infrastructure.driven.playwright_adapter.async_playwright"
    ) as mock_async_pw:
        mock_mgr = AsyncMock()
        mock_mgr.start.return_value = mock_pw
        mock_async_pw.return_value = mock_mgr

        await adapter.activate_account("acc_123")

        mock_file_system.copy_to_active.assert_called_once_with("acc_123")
        mock_pw.chromium.launch_persistent_context.assert_called_once()
        mock_browser_context.route.assert_called_once_with(
            "**/*", adapter._abort_heavy_resources
        )

        await adapter.deactivate_account("acc_123")

        mock_browser_context.close.assert_called_once()
        mock_file_system.copy_to_cache.assert_called_once_with("acc_123")


@pytest.mark.asyncio
async def test_abort_heavy_resources() -> None:
    adapter = PlaywrightAdapter(file_system=AsyncMock())

    mock_route_image = AsyncMock()
    mock_route_image.request.resource_type = "image"
    await adapter._abort_heavy_resources(mock_route_image)
    mock_route_image.abort.assert_called_once()

    mock_route_doc = AsyncMock()
    mock_route_doc.request.resource_type = "document"
    await adapter._abort_heavy_resources(mock_route_doc)
    mock_route_doc.continue_.assert_called_once()
