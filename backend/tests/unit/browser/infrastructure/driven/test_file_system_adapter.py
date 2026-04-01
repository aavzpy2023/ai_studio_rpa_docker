from pathlib import Path

import pytest

from browser.infrastructure.driven.file_system_adapter import FileSystemAdapter


@pytest.mark.asyncio
async def test_file_system_adapter_copies_to_active_and_back(tmp_path: Path) -> None:
    adapter = FileSystemAdapter(base_path=str(tmp_path))
    account_id = "acc_123"

    cache_path = tmp_path / "cache" / account_id
    cache_path.mkdir(parents=True, exist_ok=True)
    (cache_path / "profile.json").write_text('{"token": "test"}')

    await adapter.copy_to_active(account_id)

    active_path = tmp_path / "active" / account_id
    assert active_path.exists()
    assert (active_path / "profile.json").exists()

    (active_path / "profile.json").write_text('{"token": "updated_by_playwright"}')
    await adapter.copy_to_cache(account_id)

    assert (
        cache_path / "profile.json"
    ).read_text() == '{"token": "updated_by_playwright"}'
