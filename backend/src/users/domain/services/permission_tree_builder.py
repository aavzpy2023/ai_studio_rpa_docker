"""
Service responsible for transforming flat permission lists into hierarchical trees.
Follows the convention: MODULE_RESOURCE_ACTION.
"""

from collections import defaultdict
from typing import Any

from users.domain.entities.permission import Permission


class PermissionTreeBuilder:
    """
    Transforms a list of Permission entities into a nested dictionary structure.
    Target format: { "MODULE": { "RESOURCE": [ { "id": 1, "action": "READ" } ] } }
    """

    def build(
        self, permissions: list[Permission]
    ) -> dict[str, dict[str, list[dict[str, Any]]]]:
        tree: dict[str, dict[str, list[dict[str, Any]]]] = defaultdict(
            lambda: defaultdict(list)
        )

        for perm in permissions:
            parts = perm.name.value.split("_")

            # Logic: Categorization based on naming convention
            if len(parts) >= 3:
                # Standard: INVENTORY_PRODUCTS_READ
                module = parts[0]
                resource = parts[1]
                action = "_".join(parts[2:])
            elif len(parts) == 2:
                # Legacy: SALES_READ -> Module: SALES, Resource: GENERAL
                module = parts[0]
                resource = "GENERAL"
                action = parts[1]
            else:
                # Fallback: ADMIN -> Module: SYSTEM, Resource: GENERAL
                module = "SYSTEM"
                resource = "GENERAL"
                action = perm.name.value

            # Populate Tree
            tree[module][resource].append(
                {
                    "id": perm.id,
                    "action": action,
                    "description": perm.description,
                    "full_name": perm.name.value,
                }
            )

        # Convert defaultdict to regular dict for clean JSON serialization
        return {k: dict(v) for k, v in tree.items()}
