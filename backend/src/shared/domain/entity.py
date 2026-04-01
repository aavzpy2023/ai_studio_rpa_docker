"""Base entity class for domain entities.

This module provides a base class for all domain entities, encapsulating
common entity behavior such as timestamp tracking for creation and updates.
"""

from datetime import UTC, datetime


class BaseEntity:
    """Abstract base class for all domain entities.

    Provides automatic timestamp management for entity creation and updates.
    All domain entities should inherit from this class to ensure consistent
    audit trail capabilities.

    Attributes:
        created_at: Timestamp when the entity was created (read-only).
        updated_at: Timestamp when the entity was last updated (read-only).
    """

    def __init__(self) -> None:
        """Initialize a new entity with current timestamps."""
        # Set creation timestamp (immutable after initialization)
        self._created_at = datetime.now(UTC)
        # Set initial update timestamp
        self._updated_at = datetime.now(UTC)

    @property
    def created_at(self) -> datetime:
        """Get the entity creation timestamp.

        Returns:
            The datetime when the entity was created.
        """
        return self._created_at

    @property
    def updated_at(self) -> datetime:
        """Get the entity's last update timestamp.

        Returns:
            The datetime when the entity was last updated.
        """
        return self._updated_at

    def change_updated_at(self) -> None:
        """Update the entity's modification timestamp to the current time.

        This method should be called whenever the entity's state changes
        to maintain an accurate audit trail.
        """
        self._updated_at = datetime.now(UTC)
