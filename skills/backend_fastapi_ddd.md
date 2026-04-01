# BACKEND PROTOCOL: FASTAPI & DDD

## 0. STATE OF THE ART TOOLING (v12.4)
- **Dependency Management:** Use `uv` strictly via `pyproject.toml`.
- **Linting & Security:** Use `Ruff` with `flake8-bandit` enabled.
- **Domain Exceptions:** Generic `ValueError` or `Exception` are PROHIBITED. Always create hierarchical Domain Exceptions (e.g., `UserDomainError`).


## 1. HEXAGONAL & DDD ARCHITECTURE
Strict boundary separation is mandatory:
- `domain/`: Pure Python. Entities, Value Objects, Exception definitions, Repository Interfaces (Ports). NO external dependencies (no Pydantic, no SQLAlchemy).
- `application/`: Use Cases, DTOs (Pydantic). Orchestrates domain logic.
- `infrastructure/`: Implementations of Ports (SQLAlchemy Repositories, External APIs), Framework setup (FastAPI).

## 2. COMMAND PATTERN (USE CASES)
- One class per Use Case. 
- Must expose an `execute()` method. 
- No bloated/monolithic "Services" (e.g., `UserService` with 20 methods is FORBIDDEN. Use `CreateUser`, `UpdateUser`, `DeleteUser`).

## 3. BOUNDARY MARSHAL (DTOS)
- API boundaries (Controllers/Routers) must use Pydantic V2 DTOs (`strict=True`, `extra='forbid'`).
- DTO properties MUST be primitives. Value Objects or Domain Entities MUST NEVER leak to the controller output or be accepted as input.
- Controllers map primitives to Value Objects/Entities before passing to the Application layer.

## 4. DEPENDENCY INJECTION
- Use `kink` for DI (`@inject`).
- Wiring must occur EXCLUSIVELY in `infrastructure/config/container.py`. Application and Domain layers do not wire themselves.

## 5. TESTING (TDE)
- Use `pytest`.
- Isolate domain logic testing completely from infrastructure.
- Use Architectural Fakes (e.g., `InMemoryUserRepository`) over fragile mocks (`unittest.mock.patch`) whenever testing Application Use Cases.