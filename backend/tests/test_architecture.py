from pathlib import Path
from typing import Any

from pytest_archon import archrule

BASE_SRC = Path(__file__).parent.parent / "src"
TECHNICAL_PACKAGES = {"shared", "infrastructure"}

# Modificado para filtrar módulos sin archivos de dominio (evita falsos positivos)
ALL_BUSINESS_MODULES = [
    d.name
    for d in BASE_SRC.iterdir()
    if d.is_dir()
    and (d / "__init__.py").exists()
    and d.name not in TECHNICAL_PACKAGES
    and any((d / "domain").rglob("*.py"))
]


def test_domain_model_isolation() -> None:
    for module in ALL_BUSINESS_MODULES:
        (
            archrule(f"Domain isolation in {module}")
            .match(f"{module}.domain*")
            .should_not_import(f"{module}.application*")
            .should_not_import(f"{module}.infrastructure*")
            .may_import("shared*")
            .may_import(f"{module}.domain*")
            .check(module)
        )


def test_application_layer_purity() -> None:
    for module in ALL_BUSINESS_MODULES:
        # Check if application layer has actual content
        app_path = BASE_SRC / module / "application"
        if not any(app_path.rglob("*.py")):
            continue

        (
            archrule(f"Application purity in {module}")
            .match(f"{module}.application*")
            .should_not_import(f"{module}.infrastructure.driving*")
            .may_import(f"{module}.domain*")
            .may_import("shared*")
            .check(module)
        )


def test_shared_kernel_independence() -> None:
    rule: Any = archrule("Shared Kernel Independence").match("shared*")
    for business_module in ALL_BUSINESS_MODULES:
        rule = rule.should_not_import(f"{business_module}*")
    rule.check("shared")


def test_infrastructure_driven_isolation() -> None:
    for module in ALL_BUSINESS_MODULES:
        # Check if infrastructure driven layer has actual content
        infra_path = BASE_SRC / module / "infrastructure" / "driven"
        if not any(infra_path.rglob("*.py")):
            continue

        (
            archrule(f"Infra isolation in {module}")
            .match(f"{module}.infrastructure.driven*")
            .should_not_import(f"{module}.infrastructure.driving*")
            .check(module)
        )
