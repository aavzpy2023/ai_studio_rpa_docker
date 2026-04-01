"""
Boilerplate Bootstrap Script.
Run with: python src/seed_demo_data.py
"""

import os
import sys

sys.path.append(os.path.join(os.path.dirname(__file__), ".."))

from infrastructure.config.container import Container


def bootstrap() -> None:
    print("[SEED] 🌱 Initializing Boilerplate data...")
    # This automatically triggers IAM roles & system admin seeding
    Container.init_resources()
    print("[SEED] ✨ Boilerplate initialized.")


if __name__ == "__main__":
    bootstrap()
