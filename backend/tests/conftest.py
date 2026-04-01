import os
import sys
from pathlib import Path

# [CRITICAL] Set test environment variables BEFORE any application imports
os.environ["ENVIRONMENT"] = "testing"
os.environ["DB_HOST"] = os.getenv("TEST_DB_HOST", "127.0.0.1")
os.environ["DB_PORT"] = os.getenv("TEST_DB_PORT", "5433")
sys.path.insert(0, str(Path(__file__).parent.parent / "src"))

from collections.abc import Generator
from types import TracebackType
from typing import Self

import pytest

# Application Imports
from fastapi.testclient import TestClient
from kink import di
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm import Session

from app import app  # noqa: E402
from infrastructure.config.container import Container  # noqa: E402
from infrastructure.config.limiter import limiter
from shared.infrastructure.persistence.database import (  # noqa: E402
    DATABASE_URL,
    DB_HOST,
    DB_PASSWORD,
    DB_PORT,
    DB_USER,
    Base,
    SessionLocal,
)
from shared.infrastructure.persistence.database import (  # noqa: E402
    engine as app_engine,
)
from shared.infrastructure.persistence.unit_of_work import UnitOfWork  # noqa: E402
from users.application.use_cases.create_role import CreateRole
from users.application.use_cases.delete_role import DeleteRole
from users.application.use_cases.login_user import LoginUser
from users.application.use_cases.register_user import RegisterUser
from users.application.use_cases.toggle_user_status import ToggleUserStatus
from users.application.use_cases.update_user_profile import UpdateUserProfile
from users.application.use_cases.update_user_role import UpdateUserRole
from users.domain.repositories.role_repo import RoleRepository
from users.domain.repositories.user_repo import UserRepository
from users.domain.services.security_services import HashingService, TokenService
from users.infrastructure.driven.persistence.postgres_role_repo import (
    PostgresRoleRepository,
)
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)

# Global flag to avoid multiple connection attempts or failures cascading
POSTGRES_READY = False


# =============================================================================
# SESSION-LEVEL SETUP
# =============================================================================


@pytest.fixture(scope="session", autouse=True)
def setup_test_environment() -> None:
    """
    Initializes the DI Container and checks Postgres availability.
    Sets up the Test Database schema and seeds initial data.
    Does NOT fail the session if Postgres is down (marks tests as skipped).
    """
    global POSTGRES_READY

    # 1. Initialize Application Container
    Container.init_resources()

    # Disable Rate Limiter for Tests to prevent 429 errors
    limiter.enabled = False

    # [CRITICAL] Force registration of UnitOfWork for Integration Tests
    # This ensures RegisterUser/LoginUser use cases have valid dependencies.
    di[UnitOfWork] = lambda _: UnitOfWork()

    # 2. Silently check if Postgres is available for Integration Tests
    # We connect to the default 'postgres' db to check/create the test db.
    test_db_name = DATABASE_URL.split("/")[-1]
    admin_url = (
        f"postgresql+psycopg://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/postgres"
    )
    admin_engine = create_engine(admin_url, isolation_level="AUTOCOMMIT")

    try:
        with admin_engine.connect() as conn:
            # Check/Create test DB
            exists = conn.execute(
                text("SELECT 1 FROM pg_database WHERE datname = :db_name"),
                {"db_name": test_db_name},
            ).scalar()

            if not exists:
                conn.execute(text(f"CREATE DATABASE {test_db_name}"))

        # 3. Sync Schema & SEED DATA
        # We use the application engine which connects to the TEST DB
        with app_engine.begin() as conn:
            Base.metadata.drop_all(bind=conn)
            # Create Tables
            Base.metadata.drop_all(bind=conn)
            # Re-create Tables with latest model definitions
            Base.metadata.create_all(bind=conn)

            # [CRITICAL] Seed Roles & Permissions explicitly for Testing
            # This ensures RBAC logic works immediately without relying on external
            # scripts.
            print("[TEST-CONF] 🌱 Seeding Roles and Permissions in Test DB...")
            conn.execute(
                text(
                    """
                -- 1. ROLES
                INSERT INTO public.dff_role (id, role, is_system, created_at) VALUES
                (1, 'admin', true, NOW()),
                (2, 'viewer', true, NOW()),
                (3, 'sales_rep', false, NOW()),
                (4, 'sales_manager', false, NOW()),
                (5, 'buyer', false, NOW()),
                (6, 'purchasing_manager', false, NOW()),
                (7, 'inventory_manager', false, NOW()),
                (8, 'customer_support', false, NOW())
                ON CONFLICT (id) DO UPDATE SET
                    is_system = EXCLUDED.is_system;

                -- 2. PERMISSIONS
INSERT INTO public.dff_permission (id, name, resource, description, created_at) VALUES
                (1, 'SALES_READ', 'sales', 'View sales data', NOW()),
                (2, 'INVENTORY_READ', 'inventory', 'View inventory', NOW()),
                (3, 'USERS_READ', 'users', 'View users', NOW()),
                (4, 'USERS_WRITE', 'users', 'Modify users', NOW())
                ON CONFLICT (id) DO NOTHING;

                -- 3. ROLE_PERMISSION (Pivot)
                -- Assign permissions to 'viewer' (ID 2)
                INSERT INTO public.dff_role_permission (id_role, id_permission) VALUES
                (2, 1), -- Viewer -> SALES_READ
                (2, 2)  -- Viewer -> INVENTORY_READ
                ON CONFLICT DO NOTHING;

                -- Reset sequences to avoid ID collisions
            SELECT setval(pg_get_serial_sequence('public.dff_role', 'id'), 9, false);
        SELECT setval(pg_get_serial_sequence('public.dff_permission', 'id'), 5, false);
            """
                )
            )

        POSTGRES_READY = True
        print(f"\n[TEST-CONF] ✅ Postgres ready at {DB_HOST}:{DB_PORT}")

    except (SQLAlchemyError, Exception) as e:
        POSTGRES_READY = False

        print(f"\n[TEST-CONF] ⚠️ Postgres unreachable or setup failed: {e}")

        raise e  # CRITICAL: Fail loud to expose the exact traceback

    finally:
        admin_engine.dispose()


# =============================================================================
# FUNCTION-LEVEL FIXTURES
# =============================================================================


@pytest.fixture
def session() -> Generator[Session]:
    """
    Provides a real DB session for integration tests.
    Skips the test automatically if Postgres is down.
    Rolls back changes after each test to ensure isolation.
    """
    if not POSTGRES_READY:
        pytest.skip("Postgres is not available in this environment")

    connection = app_engine.connect()
    transaction = connection.begin()
    session = SessionLocal(bind=connection)

    # This mocks the 'commit' behavior to just 'flush', keeping the transaction alive
    # for rollback.
    class NoCommitSession(Session):
        def commit(self) -> None:
            self.flush()

        def close(self) -> None:
            pass  # Prevent closing by application code

    # Create the safe session bound to the connection
    safe_session = NoCommitSession(bind=connection, expire_on_commit=False)

    # Inject the SAFE session
    di[Session] = safe_session
    di[UserRepository] = PostgresUserRepository(safe_session)

    # Override UnitOfWork to use the safe session
    class TestUnitOfWork(UnitOfWork):
        def __init__(self) -> None:
            self.session = safe_session

        def __enter__(self) -> Self:
            return self

        def __exit__(
            self,
            exc_type: type[BaseException] | None,
            exc_val: BaseException | None,
            exc_tb: TracebackType | None,
        ) -> None:
            pass

        def commit(self) -> None:
            self.session.flush()

        def rollback(self) -> None:
            pass

    di[UnitOfWork] = lambda _: TestUnitOfWork()

    # 1. Resolve Dependencies
    hasher = di[HashingService]  # type: ignore
    token_service = di[TokenService]  # type: ignore
    uow = di[UnitOfWork]
    user_repo = di[UserRepository]  # type: ignore

    role_repo = PostgresRoleRepository(safe_session)
    di[RoleRepository] = role_repo

    # 2. Re-wire Users Module
    di[RegisterUser] = RegisterUser(uow, hasher)
    di[LoginUser] = LoginUser(uow, hasher, token_service)
    di[UpdateUserProfile] = UpdateUserProfile(user_repo)
    di[UpdateUserRole] = UpdateUserRole(uow)
    di[ToggleUserStatus] = ToggleUserStatus(uow)
    di[CreateRole] = CreateRole(uow)
    di[DeleteRole] = DeleteRole(uow)

    yield safe_session

    # Cleanup logic remains on the REAL session/connection
    session.close()  # Close the original handle if any
    if transaction.is_active:
        transaction.rollback()
    connection.close()


@pytest.fixture
def client(session: Session) -> Generator[TestClient]:
    """
    Returns a FastAPI TestClient.
    The app dependency injection is already patched by the 'session' fixture
    because 'di' is global.
    """
    with TestClient(app) as c:
        yield c


@pytest.fixture
def db_session(session: Session) -> Session:
    """Alias for the 'session' fixture to match naming conventions in tests."""
    return session


@pytest.fixture
def admin_token(client: TestClient, session: Session) -> str:
    """
    Creates an admin user in the test database and returns a valid JWT access token.
    Uses domain objects directly to bypass API rate limits or restrictions.
    """
    from users.domain.entities.user import User
    from users.domain.value_objects.user_email import UserEmail
    from users.domain.value_objects.user_firstname import UserFirstName
    from users.domain.value_objects.user_hashed_password import HashedPassword
    from users.domain.value_objects.user_id import UserID
    from users.domain.value_objects.user_lastname import UserLastName
    from users.domain.value_objects.user_middname import UserMiddName
    from users.domain.value_objects.user_phonenumber import UserPhoneNumber
    from users.domain.value_objects.user_role import UserRole
    from users.domain.value_objects.user_username import UserName
    from users.infrastructure.driven.persistence.postgres_user_repo import (
        PostgresUserRepository,
    )

    # 1. Setup Data
    password_raw = "TestAdmin123!"
    # Reuse the Hasher from DI
    hasher = di[HashingService]  # type: ignore
    hashed_pwd = hasher.hash(password_raw)

    repo = PostgresUserRepository(session)
    username_vo = UserName("test_admin")

    # 2. Check Existence & Upsert
    existing = repo.get_by_username(username_vo)

    if existing:
        # Update existing user to ensure credentials match
        existing._password = HashedPassword.from_string(hashed_pwd)
        existing._is_active = True
        existing.rotate_session_id()
        repo.save(existing)
        target_user = existing
    else:
        # Create new
        user = User(
            user_id=UserID.from_string("00000000-0000-0000-0000-000000000001"),
            user_role=UserRole(UserRole.ADMIN),
            firstname=UserFirstName.from_str("Test"),
            lastname=UserLastName.from_str("Admin"),
            middname=UserMiddName.from_str(""),
            username=username_vo,
            email=UserEmail.from_string("test_admin@example.com"),
            password=HashedPassword.from_string(hashed_pwd),
            phone=UserPhoneNumber.from_str("11111111111"),
            is_active=True,
        )
        user.rotate_session_id()
        repo.save(user)
        target_user = user

    # 3. Flush to ensure visibility in the same transaction
    session.flush()

    # 4. Generate Token directly bypassing HTTP overhead
    token_service = di[TokenService]  # type: ignore
    token_payload = {
        "sub": target_user.id.value,
        "role": target_user.role.value,
        "email": target_user.email.value,
        "username": target_user.username.value,
        "sid": target_user.session_id,
    }
    return token_service.create_access_token(token_payload)
