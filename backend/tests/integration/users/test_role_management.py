from types import TracebackType
from typing import Self

import pytest
from sqlalchemy.orm import Session

from shared.infrastructure.persistence.unit_of_work import UnitOfWork
from users.application.use_cases.create_role import CreateRole
from users.application.use_cases.delete_role import DeleteRole
from users.domain.entities.user import User
from users.domain.exceptions import UserDomainError
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName
from users.infrastructure.driven.persistence.postgres_role_repo import (
    PostgresRoleRepository,
)
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)

pytestmark = pytest.mark.integration


class IntegrationTestUoW(UnitOfWork):
    """Adapter to force Use Cases to run on the Test Session."""

    def __init__(self, session: Session):
        self.session = session

    def __enter__(self) -> Self:
        return self

    def __exit__(
        self,
        exc_type: type[BaseException] | None,
        exc_val: BaseException | None,
        exc_tb: TracebackType | None,
    ) -> None:
        pass


def test_should_create_and_delete_custom_role(session: Session) -> None:
    """
    Happy Path: Create a dynamic role -> Verify -> Delete it.
    """
    # Arrange
    # Nota: Los use cases se inyectan automáticamente con el Mock UoW del conftest
    # pero aquí validamos la lógica directa sobre la sesión de integración.

    uow = IntegrationTestUoW(session)
    create_uc = CreateRole(uow)
    delete_uc = DeleteRole(uow)
    repo = PostgresRoleRepository(session)

    role_name = "junior_analyst"

    # Act 1: Create
    create_uc.execute(role_name)

    # Assert 1
    assert repo.exists(UserRole(role_name))
    assert not repo.get_system_status(UserRole(role_name))

    # Act 2: Delete
    delete_uc.execute(role_name)

    # Assert 2
    assert not repo.exists(UserRole(role_name))


def test_should_prevent_deletion_of_system_roles(session: Session) -> None:
    """
    Security Rule: System roles (seeded as True) cannot be deleted.
    """

    uow = IntegrationTestUoW(session)
    delete_uc = DeleteRole(uow)

    # 'admin' is seeded as is_system=True in conftest.py
    with pytest.raises(UserDomainError, match="protected"):
        delete_uc.execute("admin")


def test_should_prevent_deletion_of_assigned_roles(session: Session) -> None:
    """
    Integrity Rule: Cannot delete a role if users have it.
    """

    uow = IntegrationTestUoW(session)
    create_uc = CreateRole(uow)
    delete_uc = DeleteRole(uow)
    user_repo = PostgresUserRepository(session)

    # 1. Create Role
    role_name = "temp_contractor"
    create_uc.execute(role_name)

    # Force role visibility
    session.flush()

    # 2. Assign to User
    user = User(
        user_id=UserID.from_string("550e8400-e29b-41d4-a716-446655440099"),
        user_role=UserRole(role_name),
        firstname=UserFirstName.from_str("Test"),
        lastname=UserLastName.from_str("User"),
        middname=UserMiddName.from_str("None"),
        username=UserName("role_tester"),
        email=UserEmail.from_string("role@test.com"),
        password=HashedPassword.from_string("$2b$12$ValidHashForTestMustBeLongEnough"),
        phone=UserPhoneNumber.from_str("12345678901"),
    )
    user_repo.save(user)

    # Verify setup before action
    session.flush()
    assert user_repo.count_by_role(UserRole(role_name)) > 0, (
        "Test Setup Failed: User not assigned to role"
    )

    # 3. Attempt Delete
    with pytest.raises(UserDomainError, match="assigned to"):
        delete_uc.execute(role_name)
