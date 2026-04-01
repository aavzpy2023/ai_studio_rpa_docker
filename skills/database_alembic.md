# DATABASE PROTOCOL: SQLALCHEMY 2 & ALEMBIC

## 1. ORM MAPPING (SQLALCHEMY 2.0)
- Use strict type-hinted style: `Mapped[type]` and `mapped_column()`.
- Example: `id: Mapped[uuid.UUID] = mapped_column(primary_key=True)`
- Models must inherit from the centralized `Base` located in `shared.infrastructure.persistence.database`.

## 2. THE MODELS REGISTRY
- Every new ORM model MUST be explicitly imported in `infrastructure/config/models_registry.py`.
- This bypasses unused import warnings (`# noqa: F401`) and guarantees 100% schema visibility for Alembic when generating migrations.
- If it's not in the registry, the table does not exist.

## 3. MIGRATIONS (ALEMBIC)
- Direct manual Database schema changes via raw SQL or DB clients are FORBIDDEN.
- Always use Alembic revision autogeneration: `alembic revision --autogenerate -m "feat: description"`.
- Always inspect the generated migration file to ensure it doesn't drop unexpected tables before applying `alembic upgrade head`.

## 4. PERSISTENCE BOUNDARY
- Active Record pattern is PROHIBITED.
- Repositories MUST implement the Mapper Pattern. They receive Domain Entities, translate them to ORM models internally (`_to_orm`), save them, and return pure Domain Entities (`_to_domain`).