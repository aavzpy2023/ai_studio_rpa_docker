import os
import sys
from typing import cast

from kink import di
from sqlalchemy import text
from sqlalchemy.orm import Session, scoped_session

# --- SHARED INFRASTRUCTURE ---
from shared.infrastructure.persistence.database import Base, SessionLocal, engine
from shared.infrastructure.persistence.unit_of_work import UnitOfWork

# =============================================================================
# MODULE: USERS
# =============================================================================
from users.domain.entities.user import User
from users.domain.repositories.role_repo import RoleRepository
from users.domain.repositories.user_repo import UserRepository
from users.domain.services.permission_tree_builder import PermissionTreeBuilder
from users.domain.services.security_services import HashingService, TokenService
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName
from users.infrastructure.driven.persistence.in_memory_user_repo import (
    InMemoryUserRepository,
)
from users.infrastructure.driven.persistence.postgres_role_repo import (
    PostgresRoleRepository,
)
from users.infrastructure.driven.persistence.postgres_user_repo import (
    PostgresUserRepository,
)
from users.infrastructure.driven.security.bcrypt_adapter import BcryptAdapter
from users.infrastructure.driven.security.jwt_adapter import JwtAdapter

jwt_secret = os.getenv("JWT_SECRET", "CHANGE_THIS_UNSECURE_DEFAULT_KEY")


class Container:
    """Dependency injection container for application-wide resource management."""

    @staticmethod
    def init_resources() -> None:
        """Initialize and configure all application dependencies."""
        env = os.getenv("ENVIRONMENT", "development")
        print(f"[CONTAINER] 🚀 Initializing resources for environment: {env.upper()}")

        # 1. STATELESS ADAPTERS (Common)
        di[HashingService] = BcryptAdapter()
        di[PermissionTreeBuilder] = PermissionTreeBuilder()

        if env == "production" and jwt_secret == "CHANGE_THIS_UNSECURE_DEFAULT_KEY":
            raise RuntimeError(
                "[CRITICAL] JWT_SECRET is unset or using default in PRODUCTION. "
                "System startup aborted for security."
            )
        di[TokenService] = JwtAdapter(secret_key=jwt_secret)

        # 2. UNIT OF WORK (Critical: Always available via Factory)
        di.factories[UnitOfWork] = lambda _: UnitOfWork()

        # 3. PERSISTENCE LAYER (Environment Specific)
        if env in ["production", "development"]:
            print(f"[CONTAINER] 🐘 Connecting to PostgresSQL ({env})...")
            try:
                with engine.connect() as conn:
                    conn.commit()

                # Schema Sync: Auto-create tables if Alembic migrations are missing/empty
                import infrastructure.config.models_registry  # noqa: F401

                Base.metadata.create_all(bind=engine)

                # --- SELF-HEALING SCHEMA ---
                # Resolves "InFailedSqlTransaction" by guaranteeing the column exists
                # even if Alembic skipped it during a fresh DB anomaly.
                try:
                    with engine.begin() as conn:
                        conn.execute(
                            text(
                                "ALTER TABLE accounts ADD COLUMN IF NOT EXISTS session_file VARCHAR(255);"
                            )
                        )
                except Exception as e:
                    print(f"[CONTAINER] ℹ️ Schema self-healing skipped: {e}")

                db_session = scoped_session(SessionLocal)
                di[scoped_session] = db_session

                # FIX: Double-cast proxy to satisfy static type checkers
                # scoped_session is a proxy, not a direct subclass of Session
                session_proxy = cast(Session, cast(object, db_session))

                # Repo Injection using the safe proxy
                di[UserRepository] = PostgresUserRepository(session_proxy)
                di[RoleRepository] = PostgresRoleRepository(session_proxy)
                from accounts.domain.repositories.account_repo import AccountRepository
                from accounts.infrastructure.driven.persistence import (
                    postgres_account_repo as pg_repo,
                )

                di[AccountRepository] = pg_repo.PostgresAccountRepository(session_proxy)

                # Browser & FileSystem Ports Injection
                from browser.domain.ports.ai_studio_port import AIStudioPort
                from browser.domain.ports.browser_manager_port import BrowserManagerPort
                from browser.domain.ports.file_system_port import FileSystemPort
                from browser.infrastructure.driven.file_system_adapter import (
                    FileSystemAdapter,
                )
                from browser.infrastructure.driven.playwright_impl.aistudio_adapter import AIStudioAdapter
                from browser.infrastructure.driven.playwright_impl.browser_manager_adapter import BrowserManagerAdapter
                from browser.infrastructure.driven.playwright_impl.engine import PlaywrightEngine

                file_system_adapter = FileSystemAdapter()
                di[FileSystemPort] = file_system_adapter

                playwright_engine = PlaywrightEngine(file_system=file_system_adapter)
                di[BrowserManagerPort] = BrowserManagerAdapter(engine=playwright_engine, file_system=file_system_adapter)
                di[AIStudioPort] = AIStudioAdapter(engine=playwright_engine)

                # Chat Use Cases Injection
                from chat.application.use_cases.send_message import SendMessageUseCase

                di[SendMessageUseCase] = SendMessageUseCase()

                # 4. BOOTSTRAPPING
                # We use a temporary local session for seeding to avoid locking the
                # scoped session during startup
                try:
                    with SessionLocal() as seed_session:
                        Container._seed_roles(seed_session)
                        Container._seed_system_admin()
                        seed_session.commit()
                except Exception as seed_err:
                    print(f"[CONTAINER] ⚠️ Skipping seeds: {seed_err}")

            except Exception as e:
                print(
                    f"[CONTAINER] ❌ Fatal error connecting to DB: {e}", file=sys.stderr
                )
                raise e

        elif env == "testing":
            try:
                with engine.connect() as conn:
                    conn.commit()
                # Initialize DB Schema & Seeds for Integration Tests
                import infrastructure.config.models_registry  # noqa: F401

                Base.metadata.create_all(bind=engine)
                # Seed minimal roles for tests
                with SessionLocal() as session:
                    Container._seed_roles(session)
                    session.commit()
                print("[CONTAINER] 🧪 Test DB seeded successfully.")
            except Exception as e:
                print(f"[CONTAINER] ℹ️ Test DB initialization skipped: {e}")

            # Use In-Memory repos for unit/isolation logic if needed
            di[UserRepository] = InMemoryUserRepository()
        else:
            di[UserRepository] = InMemoryUserRepository()

    @staticmethod
    def _seed_roles(session: Session) -> None:
        """Seed roles AND permissions to ensure RBAC works out-of-the-box."""
        try:
            # Seed Roles
            session.execute(
                text(
                    """
                    INSERT INTO public.dff_role (id, role, is_system, created_at) VALUES
                    (1, 'admin', true, NOW()),
                    (2, 'viewer', true, NOW()),
                    (3, 'developer', false, NOW())
                    ON CONFLICT (id) DO UPDATE SET
                        is_system = EXCLUDED.is_system;
            SELECT setval(pg_get_serial_sequence('public.dff_role', 'id'), 20, false);
                """
                )
            )

            # Seed Permissions (Expanded for IAM Matrix)
            # 1-2: Sales, 3-4: Inventory, 5-6: Users, 7-8: Contacts, 9-10: Purchasing
            session.execute(
                text(
                    """
INSERT INTO public.dff_permission (name, resource, description, created_at) VALUES
                    ('USERS_READ', 'users', 'View users', NOW()),
                    ('USERS_WRITE', 'users', 'Modify users', NOW())
                ON CONFLICT (name) DO UPDATE SET
                    resource = EXCLUDED.resource,
                    description = EXCLUDED.description;

                -- 2. Ensure Roles exist
                INSERT INTO public.dff_role (role, is_system, created_at) VALUES
                    ('admin', true, NOW()), ('viewer', true, NOW())
                ON CONFLICT (role) DO UPDATE SET
                    is_system = EXCLUDED.is_system;

                -- 3. DYNAMIC MAPPING (The key to fixing your error)
                -- This connects Roles to Permissions by NAME, ignoring inconsistent IDs

                -- Clear current admin permissions to ensure full synchronization
                DELETE FROM public.dff_role_permission
                WHERE id_role = (SELECT id FROM public.dff_role WHERE role = 'admin');

                -- Grant ALL current permissions to Admin
                INSERT INTO public.dff_role_permission (id_role, id_permission)
                SELECT r.id, p.id
                FROM public.dff_role r, public.dff_permission p
                WHERE r.role = 'admin'
                ON CONFLICT DO NOTHING;

                SELECT setval(pg_get_serial_sequence('public.dff_role', 'id'),
                             (SELECT MAX(id) FROM public.dff_role));
                SELECT setval(pg_get_serial_sequence('public.dff_permission', 'id'),
                             (SELECT MAX(id) FROM public.dff_permission));

                """
                )
            )

            session.commit()
            print("[CONTAINER] ✅ RBAC Security Matrix seeded successfully.")
        except Exception as e:
            session.rollback()
            print(f"[CONTAINER] ⚠️ Role/Permission seeding warning: {str(e)}")

    @staticmethod
    def _seed_system_admin() -> None:
        """
        Bootstraps the system administrator and ensures it maintains
        ADMIN privileges (Self-Healing Pattern).
        """
        try:
            repo = di[UserRepository]  # type: ignore[type-abstract]
            hasher = di[HashingService]  # type: ignore[type-abstract]

            # 1. Configuration Recovery
            admin_user = os.getenv("SYSTEM_ADMIN_USERNAME", "r00t")
            admin_pass = os.getenv("SYSTEM_ADMIN_PASSWORD", "David*2017")
            admin_email = os.getenv("SYSTEM_ADMIN_EMAIL", "r00t@dfgchatai.com")

            admin_vo = UserName(admin_user)
            existing = repo.get_by_username(admin_vo)

            # 2. Self-Healing Logic (If account was downgraded in UI)
            if existing:
                if existing.role != UserRole.ADMIN:
                    print(
                        f"[CONTAINER] 🛡️ REPAIR: Restoring ADMIN role to '{admin_user}'"
                    )
                    existing._role = UserRole(UserRole.ADMIN)
                    repo.save(existing)
                else:
                    print(f"[CONTAINER] ℹ️ Admin user '{admin_user}' is active.")
                return

            # 3. Birth Logic (First run)
            print(f"[CONTAINER] 🌱 Bootstrapping: Creating '{admin_user}' superuser...")
            hashed_pwd = hasher.hash(admin_pass)

            admin = User(
                user_id=UserID.from_string("0"),
                user_role=UserRole(UserRole.ADMIN),
                firstname=UserFirstName.from_str("System"),
                lastname=UserLastName.from_str("Administrator"),
                middname=UserMiddName.from_str("Root"),
                username=admin_vo,
                email=UserEmail.from_string(admin_email),
                password=HashedPassword(hashed_pwd),
                phone=UserPhoneNumber.from_str("00000000000"),
            )

            repo.save(admin)
            print(f"[CONTAINER] ✅ Admin user '{admin_user}' created successfully.")

        except Exception as e:
            print(f"[CONTAINER] ❌ Bootstrapping Failed: {str(e)}", file=sys.stderr)
