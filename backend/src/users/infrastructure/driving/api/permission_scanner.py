import logging
from typing import Any

from fastapi import FastAPI
from fastapi.routing import APIRoute

from users.infrastructure.driving.api.security import RequirePermission

logger = logging.getLogger(__name__)


class PermissionScanner:
    """
    Service responsible for introspecting the FastAPI application to discover
    granular permissions defined in the code (Code-First approach).
    Infrastructure Layer: Depends heavily on Framework (FastAPI) details.
    """

    def scan(self, app: FastAPI) -> list[str]:
        """
        Iterates over all registered routes and extracts permissions
        defined in RequirePermission dependencies.
        """
        discovered_permissions: set[str] = set()

        for route in app.routes:
            if isinstance(route, APIRoute):
                # 1. Check dependencies defined in the decorator (router level)
                self._extract_from_dependencies(
                    route.dependencies, discovered_permissions
                )

                # 2. Check dependencies in the function signature (dependant)
                if route.dependant:
                    self._extract_from_dependencies(
                        route.dependant.dependencies, discovered_permissions
                    )

        sorted_perms = sorted(list(discovered_permissions))
        logger.info(f"[IAM] Scanner discovered {len(sorted_perms)} unique permissions.")
        return sorted_perms

    def _extract_from_dependencies(
        self, dependencies: list[Any], target_set: set[str]
    ) -> None:
        """Helper to recursively dig into FastAPI dependency structures."""
        for dep in dependencies:
            # Case A: Direct RequirePermission instance
            if isinstance(dep, RequirePermission):
                target_set.add(dep.required_permission)
                continue

            # Check if it is a Dependant object (FastAPI internal)
            if hasattr(dep, "call"):
                # If the callable is our RequirePermission class instance
                if isinstance(dep.call, RequirePermission):
                    target_set.add(dep.call.required_permission)

            # Recursive check for sub-dependencies
            if hasattr(dep, "dependencies") and dep.dependencies:
                self._extract_from_dependencies(dep.dependencies, target_set)
