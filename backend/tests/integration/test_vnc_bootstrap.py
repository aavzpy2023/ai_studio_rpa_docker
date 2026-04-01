from pathlib import Path


def test_bootstrap_script_exists() -> None:
    """
    Validates VNC bootstrap script placement in scripts directory.
    """
    script_path = (
        Path(__file__).parent.parent.parent.parent
        / "_scripts"
        / "dev"
        / "bootstrap_vnc.sh"
    )
    assert script_path.exists(), (
        "bootstrap_vnc.sh must exist to allow headless authentication."
    )
