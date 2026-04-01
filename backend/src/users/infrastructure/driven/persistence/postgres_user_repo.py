from sqlalchemy import select
from sqlalchemy.orm import Session

from users.domain.entities.permission import Permission

# Domain Imports
from users.domain.entities.user import User
from users.domain.repositories.user_repo import UserRepository
from users.domain.value_objects.permission_name import PermissionName
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName
from users.infrastructure.driven.persistence.permission_model import PermissionModel
from users.infrastructure.driven.persistence.role_model import RoleModel

# Infrastructure Imports
from users.infrastructure.driven.persistence.user_model import UserModel


class PostgresUserRepository(UserRepository):
    def __init__(self, session: Session):
        self.session = session

    def _to_domain(self, model: UserModel) -> User:
        return User(
            user_id=UserID.from_int(model.id),
            user_role=self._get_role_enum(model.id_role),  # Dinámico
            firstname=UserFirstName(model.firstname),
            middname=UserMiddName(model.middname or ""),
            lastname=UserLastName(model.lastname),
            username=UserName(model.username),
            email=UserEmail(model.email),
            password=HashedPassword(model.hashed_password),
            phone=UserPhoneNumber(model.phone or "00000000000"),
            failed_attempts=model.failed_attempts,
            lockout_until=model.lockout_until,
            is_active=model.active,
            session_id=model.session_id,
        )

    def save(self, user: User) -> None:
        """
        Persist user with Transaction Safety.
        """
        try:
            # 1. Check existence
            existing = self.get_by_username(user.username)

            if existing:
                # UPDATE Logic
                stmt = select(UserModel).where(
                    UserModel.username == user.username.value
                )
                model = self.session.execute(stmt).scalar_one()

                model.email = user.email.value
                model.hashed_password = user.password.value
                model.firstname = user.firstname.value
                model.lastname = user.lastname.value
                model.id_role = self._get_role_id(user.role)
                model.middname = user.middname.value if user.middname else None
                model.phone = user.phone_number.value
                model.updated_at = user.updated_at
                model.active = user.is_active
                model.failed_attempts = user.failed_attempts  # Sync security fields
                model.lockout_until = user.lockout_until
                model.session_id = user.session_id

                self.session.merge(model)
            else:
                # INSERT Logic
                model = UserModel(
                    username=user.username.value,
                    email=user.email.value,
                    hashed_password=user.password.value,
                    firstname=user.firstname.value,
                    lastname=user.lastname.value,
                    middname=user.middname.value if user.middname else None,
                    phone=user.phone_number.value,
                    id_role=self._get_role_id(user.role),
                    created_at=user.created_at,
                    updated_at=user.updated_at,
                    active=user.is_active,
                    failed_attempts=0,
                    session_id=user.session_id,
                )
                self.session.add(model)
                self.session.flush()

                # Rehydrate ID for Domain Entity
                real_db_id = UserID.from_int(model.id)
                user._id = real_db_id

            # 2. COMMIT TRANSACTION
            self.session.commit()

        except Exception as e:
            raise e

    def get_by_id(self, user_id: UserID) -> User | None:
        try:
            # Legacy DB uses Int, ensure we query with Int
            db_id = int(user_id.value)
            stmt = select(UserModel).where(UserModel.id == db_id)
            model = self.session.execute(stmt).scalar_one_or_none()
            return self._to_domain(model) if model else None
        except ValueError:
            return None

    def get_by_email(self, email: UserEmail) -> User | None:
        stmt = select(UserModel).where(UserModel.email == email.value)
        model = self.session.execute(stmt).scalar_one_or_none()
        return self._to_domain(model) if model else None

    def get_by_username(self, username: UserName) -> User | None:
        stmt = select(UserModel).where(UserModel.username == username.value)
        model = self.session.execute(stmt).scalar_one_or_none()
        return self._to_domain(model) if model else None

    def get_permissions(self, user_id: UserID) -> list[Permission]:
        """
        Fetch permissions via the updated relationship chain.
        User -> id_role -> RoleModel -> permissions (M2M) -> PermissionModel
        """
        # 1. Fetch User Model
        user_model = self.session.get(UserModel, int(user_id.value))

        if not user_model or user_model.id_role is None:
            return []

        # 2. Fetch Role Model (using new table name dff_role)
        role_model = self.session.get(RoleModel, user_model.id_role)

        if not role_model:
            return []

        # 3. Map Permissions
        permissions: list[Permission] = []
        for p_model in role_model.permissions:
            permissions.append(
                Permission(
                    permission_id=p_model.id,
                    name=PermissionName(p_model.name),
                    resource=p_model.resource,
                    description=p_model.description or "",
                )
            )

        return permissions

    def get_all(self) -> list[User]:
        stmt = select(UserModel).order_by(UserModel.created_at.desc())
        models = self.session.execute(stmt).scalars().all()
        return [self._to_domain(m) for m in models]

    def update(self, user: User) -> None:
        self.save(user)

    def _get_role_id(self, role: UserRole) -> int:
        """Fetch the integer ID from DB based on the Domain Enum name."""
        stmt = select(RoleModel.id).where(RoleModel.role == role.value)
        role_id = self.session.execute(stmt).scalar_one_or_none()

        if role_id is None:
            # Fallback a 'viewer' (ID 2 por convención de seeding) si no existe
            return 2
        return role_id

    def _get_role_enum(self, role_id: int | None) -> UserRole:
        """Fetch the Domain Enum based on the DB integer ID."""
        if role_id is None:
            return UserRole(UserRole.VIEWER)

        stmt = select(RoleModel.role).where(RoleModel.id == role_id)
        role_name = self.session.execute(stmt).scalar_one_or_none()

        try:
            return UserRole.from_string(str(role_name))
        except ValueError:
            return UserRole(UserRole.VIEWER)

    def get_all_roles(self) -> list[dict[str, object]]:
        stmt = select(RoleModel).order_by(RoleModel.id.asc())
        models = self.session.execute(stmt).scalars().unique().all()
        return [
            {
                "id": m.id,
                "name": m.role,
                "is_system": m.is_system,
                "permissions": [p.name for p in m.permissions],
            }
            for m in models
        ]

    def get_all_permissions(self) -> list[Permission]:
        stmt = select(PermissionModel).order_by(PermissionModel.id.asc())
        models = self.session.execute(stmt).scalars().all()
        return [
            Permission(
                permission_id=m.id,
                name=PermissionName(m.name),
                resource=m.resource,
                description=m.description or "",
            )
            for m in models
        ]

    def toggle_permission(self, role_id: int, perm_id: int) -> None:
        """
        Implements XOR Logic: If role has permission, remove it. Else, grant it.
        This allows the Frontend Matrix to sync state with single API calls.
        """
        role = self.session.get(RoleModel, role_id)
        perm = self.session.get(PermissionModel, perm_id)

        if role and perm:
            if perm in role.permissions:
                role.permissions.remove(perm)
            else:
                role.permissions.append(perm)
            self.session.commit()

    def count_by_role(self, role: UserRole) -> int:
        """Counts users assigned to a specific role using the integer FK."""
        role_id = self._get_role_id(role)
        # Using func.count would be better, but len() on scalar subquery works for now
        # or simplified count query:
        from sqlalchemy import func

        stmt = select(func.count(UserModel.id)).where(UserModel.id_role == role_id)
        return self.session.execute(stmt).scalar() or 0

    def sync_permissions(self, discovered_permissions: list[str]) -> tuple[int, int]:
        """
        Idempotent synchronization of permissions.
        """
        from datetime import UTC, datetime

        from users.infrastructure.driven.persistence.role_model import RoleModel

        if not discovered_permissions:
            return 0, 0

        # 1. Fetch existing permissions to calculate delta
        stmt = select(PermissionModel.name)
        existing_names = set(self.session.execute(stmt).scalars().all())

        new_permissions = [p for p in discovered_permissions if p not in existing_names]

        if not new_permissions:
            return 0, 0

        # 2. Insert new permissions
        now = datetime.now(UTC)
        new_entities = []
        for perm_name in new_permissions:
            # Inference: resource name is the first part of the permission
            # (e.g., INVENTORY_READ -> inventory)
            resource_inference = perm_name.split("_")[0].lower()

            entity = PermissionModel(
                name=perm_name,
                resource=resource_inference,
                description=f"Auto-discovered: {perm_name}",
                created_at=now,
                updated_at=now,
            )
            self.session.add(entity)
            new_entities.append(entity)

        # Flush to generate IDs for the new permissions
        self.session.flush()

        # 3. Auto-Grant to Admin (ID 1)
        # We fetch the admin role model
        admin_role = self.session.get(RoleModel, 1)
        granted_count = 0

        if admin_role:
            # SQLAlchemy relationship magic: just append to the list
            for perm_entity in new_entities:
                if perm_entity not in admin_role.permissions:
                    admin_role.permissions.append(perm_entity)
                    granted_count += 1

        self.session.commit()
        return len(new_permissions), granted_count
