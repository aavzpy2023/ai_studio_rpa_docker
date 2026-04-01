from dataclasses import FrozenInstanceError

import pytest

from users.domain.value_objects.permission_name import PermissionName


def test_value_object_is_immutable() -> None:
    """
    STRICT IMMUTABILITY CHECK
    Requirement: Value Objects must not allow state changes after instantiation.
    Static Analysis: IDE shows 'read-only'.
    Runtime Analysis: Python throws FrozenInstanceError.
    """
    # 1. Arrange
    vo = PermissionName.from_string("ADMIN_ACCESS")

    # 2. Act & Assert: Capture the specialized Dataclass error
    # Usamos FrozenInstanceError que es la excepción específica de
    # dataclasses(frozen=True)
    with pytest.raises(FrozenInstanceError) as excinfo:
        # El '# type: ignore' es necesario para que el linter (el de tu imagen)
        # no bloquee la ejecución del test.
        vo.value = "MALICIOUS_CHANGE"  # type: ignore

    # 3. Validation: Coincidimos con el mensaje real del motor de Python
    # El mensaje real es: "cannot assign to field 'value'"
    error_msg = str(excinfo.value)
    assert "cannot assign to field" in error_msg
    assert "value" in error_msg
