"""Domain exceptions for the browser module."""


class BrowserDomainError(Exception):
    """Base exception for all browser domain errors."""

    pass


class DOMSelectorError(BrowserDomainError):
    """Exception raised when a required DOM element cannot be located or
    interacted with."""

    pass


class AccountAuthError(BrowserDomainError):
    """Exception raised when account authentication fails or session is invalid."""

    pass
