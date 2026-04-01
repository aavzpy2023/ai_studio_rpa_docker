"""Domain exceptions for the users module.

This module defines custom exception classes for handling errors
specific to the user domain. All exceptions inherit from
``UserDomainError``, providing a common base for catching
user-related domain errors.
"""


class UserDomainError(Exception):
    """Base exception for all user domain errors.

    This is the root exception class for the user domain. It should be
    used to catch any domain-specific error, or extended to create more
    specific exception types.
    """

    pass


class UserNotFoundError(UserDomainError):
    """Exception raised when a requested user cannot be found.

    This exception is raised when attempting to retrieve or access a
    user that does not exist in the system (e.g. by ID or username).
    """

    pass


class InvalidUserDataError(UserDomainError):
    """Exception raised when provided user data is invalid.

    This exception is raised when user attributes fail domain
    validation rules, such as incorrect formats or missing required
    fields.
    """

    pass


class DuplicateUserError(UserDomainError):
    """Exception raised when attempting to create a duplicated user.

    This exception is raised when creating or registering a user that
    conflicts with an existing one (e.g. same username or email).
    """

    pass
