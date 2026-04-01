"""Database configuration and connection management.

This module sets up SQLAlchemy database connections with environment-based
configuration. It supports multiple environments (development, testing, production)
and handles PostgreSQL connection pooling and session management.
"""

import os
import sys
from typing import Any

from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker
from sqlalchemy.pool import NullPool


class Base(DeclarativeBase):
    """Base class for all SQLAlchemy ORM models.

    All database models should inherit from this class to be properly
    mapped and managed by SQLAlchemy.
    """

    pass


# --- DATABASE CONFIGURATION ---
# Load database credentials and connection parameters from environment variables
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "postgres")
DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = os.getenv("DB_PORT", "5432")
# Database name is case-sensitive; preserve exact casing from environment
DB_NAME = os.getenv("DB_NAME", "DFGChatAI")
ENVIRONMENT = os.getenv("ENVIRONMENT", "development")


# In testing mode, append "_test" suffix to database name to avoid data conflicts
if ENVIRONMENT == "testing":
    # Force lowercase for test database name to avoid PostgreSQL case sensitivity issues
    DB_NAME = f"{DB_NAME.lower()}_test"

# Construct the PostgreSQL connection URL with psycopg driver
DATABASE_URL = (
    f"postgresql+psycopg://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
)

# Log connection info in non-test environments (with password redacted)
if ENVIRONMENT != "testing":
    sanitized_url = DATABASE_URL.replace(f":{DB_PASSWORD}@", ":***@")
    print(f"[DATABASE] 🔌 Connecting to: {sanitized_url}", file=sys.stderr)

# Configure database engine parameters
engine_kwargs: dict[str, Any] = {
    "echo": False,  # Disable SQL query logging
    "pool_pre_ping": True,  # Verify connections before using them from the pool
    "pool_size": 20,
    "max_overflow": 10,
    "pool_timeout": 30,
    "pool_recycle": 1800,
}

# In testing, use NullPool to avoid connection reuse between tests
if ENVIRONMENT == "testing":
    engine_kwargs["poolclass"] = NullPool
    engine_kwargs.pop("pool_size", None)
    engine_kwargs.pop("max_overflow", None)
    engine_kwargs.pop("pool_timeout", None)
    engine_kwargs.pop("pool_recycle", None)

# Create the database engine
try:
    engine = create_engine(DATABASE_URL, **engine_kwargs)
except Exception as e:
    print(f"[DATABASE] ❌ Fatal error creating engine for {DB_NAME}", file=sys.stderr)
    raise e

# Create a session factory for database transactions
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
