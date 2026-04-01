"""User domain entity.

This module defines the concrete `User` entity that represents an
application user in the domain layer. It aggregates the user-related
value objects and exposes a read-only interface to them.
"""

from datetime import UTC, datetime, timedelta

from shared.domain.entity import BaseEntity
from users.domain.value_objects.user_email import UserEmail
from users.domain.value_objects.user_firstname import UserFirstName
from users.domain.value_objects.user_hashed_password import HashedPassword
from users.domain.value_objects.user_id import UserID
from users.domain.value_objects.user_lastname import UserLastName
from users.domain.value_objects.user_middname import UserMiddName
from users.domain.value_objects.user_phonenumber import UserPhoneNumber
from users.domain.value_objects.user_role import UserRole
from users.domain.value_objects.user_username import UserName


class User(BaseEntity):
    """Aggregate root for the user domain.

    The `User` entity encapsulates all identity and profile information
    related to an application user. It is composed of several value
    objects that enforce invariants at the domain level.

    Attributes:
        _id: Unique identifier of the user.
        _role: Role of the user in the system (e.g. "admin", "user").
        _firstname: First name value object.
        _middname: Middle name value object.
        _lastname: Last name value object.
        _username: Username value object.
        _email: Email address value object.
        _password: Password value object (hashed, never plain text).
        _phone_number: Phone number value object.
    """

    def __init__(
        self,
        user_id: UserID,
        user_role: UserRole,
        firstname: UserFirstName,
        middname: UserMiddName,
        lastname: UserLastName,
        username: UserName,
        email: UserEmail,
        password: HashedPassword,
        phone: UserPhoneNumber,
        failed_attempts: int = 0,
        lockout_until: datetime | None = None,
        is_active: bool = True,
        session_id: str | None = None,
    ) -> None:
        """Initialize a new :class:`User` entity.

        Args:
            user_id: Unique identifier for the user.
            user_role: Role assigned to the user within the system.
            firstname: First name value object.
            middname: Middle name value object.
            lastname: Last name value object.
            username: Username value object.
            email: Email address value object.
            password: Password value object (typically already hashed).
            phone: Phone number value object.
        """
        super().__init__()

        # Domain identity and authorization information
        self._id = user_id
        self._role = user_role
        self._session_id = session_id

        # Personal profile information
        self._firstname = firstname
        self._middname = middname
        self._lastname = lastname
        self._username = username
        self._email = email

        # Sensitive credentials and contact details
        self._password = password
        self._phone_number = phone

        self._failed_attempts = failed_attempts
        self._lockout_until = lockout_until
        self._is_active = is_active

    @property
    def is_active(self) -> bool:
        """Return is the user has access to the system"""
        return self._is_active

    @property
    def id(self) -> UserID:
        """Return the unique identifier of the user."""

        return self._id

    @property
    def role(self) -> UserRole:
        """Return the role assigned to the user in the system."""
        return self._role

    @property
    def username(self) -> UserName:
        """Return the username associated with the user account."""

        return self._username

    @property
    def email(self) -> UserEmail:
        """Return the email address of the user."""

        return self._email

    @property
    def password(self) -> HashedPassword:
        """Return the password value object for the user.

        Note:
            The underlying value object should never expose the plain
            password, only a secure representation (e.g. a hash).
        """

        return self._password

    @property
    def firstname(self) -> UserFirstName:
        """Return the user's first name value object."""

        return self._firstname

    @property
    def lastname(self) -> UserLastName:
        """Return the user's last name value object."""

        return self._lastname

    @property
    def middname(self) -> UserMiddName:
        """Return the user's middle name value object."""

        return self._middname

    @property
    def phone_number(self) -> UserPhoneNumber:
        """Return the user's phone number value object."""

        return self._phone_number

    @property
    def is_locked(self) -> bool:
        """Checks if the user is currently under a temporary lockout."""
        if self._lockout_until is None:
            return False
        # Account is locked if lockout_until is in the future
        return datetime.now(UTC) < self._lockout_until

    @property
    def session_id(self) -> str | None:
        return self._session_id

    def rotate_session_id(self) -> str:
        """Generates a new session ID to invalidate previous tokens."""
        import uuid

        new_id = str(uuid.uuid4())
        self._session_id = new_id
        self.change_updated_at()
        return new_id

    def record_failed_attempt(
        self, max_attempts: int = 3, lockout_minutes: int = 30
    ) -> None:
        """Increments failed attempts and sets lockout timestamp if threshold
        reached."""
        self._failed_attempts += 1
        if self._failed_attempts >= max_attempts:
            self._lockout_until = datetime.now(UTC) + timedelta(minutes=lockout_minutes)
        self.change_updated_at()

    def reset_attempts(self) -> None:
        """Resets the failure counter upon successful login."""
        self._failed_attempts = 0
        self._lockout_until = None
        self.change_updated_at()

    def is_admin(self) -> bool:
        """Helper to check if user has administrative privileges."""
        return self._role == UserRole.ADMIN

    # Getters para el Repositorio
    @property
    def failed_attempts(self) -> int:
        return self._failed_attempts

    @property
    def lockout_until(self) -> datetime | None:
        return self._lockout_until

    def update_profile(
        self, firstname: str, lastname: str, phone: str, middname: str | None = None
    ) -> None:
        """
        Updates the user's mutable profile information.
        Enforces invariants via Value Objects validation.
        """
        self._firstname = UserFirstName.from_str(firstname)
        self._lastname = UserLastName.from_str(lastname)
        self._phone_number = UserPhoneNumber.from_str(phone)

        if middname:
            self._middname = UserMiddName.from_str(middname)

        self.change_updated_at()

    def toggle_active_status(self) -> None:
        """
        Toggles the active status of the user (Soft Delete mechanism).
        """
        self._is_active = not self._is_active
        self.change_updated_at()
