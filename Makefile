# ==============================================================================
#  ENTERPRISE | MASTER MAKEFILE (v6.0.0)
# ==============================================================================
#  Orchestrates Docker infrastructure, Local Development, and Quality Assurance.
#  Cross-platform compatible (Linux, macOS, Windows via Git Bash).
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. CONFIGURATION & PATHS
# ------------------------------------------------------------------------------

MAKEFLAGS += --no-print-directory

ifeq ($(OS),Windows_NT)
    VENV_BIN_DIR := Scripts
    PYTHON_EXEC  := python
else
    VENV_BIN_DIR := bin
    PYTHON_EXEC  := python3
endif

BACKEND_ROOT  := backend
BACKEND_SRC   := backend/src
BACKEND_TESTS := backend/tests
FRONTEND_ROOT := frontend-react

BACKEND_VENV := $(BACKEND_ROOT)/.venv
LOCAL_PIP    := $(BACKEND_VENV)/$(VENV_BIN_DIR)/pip
LOCAL_PYTHON := $(BACKEND_VENV)/$(VENV_BIN_DIR)/python

ifneq (,$(wildcard ./.env))
    include .env
    export
endif

COMPOSE_FILE ?= docker-compose.yml
-include Makefile.local

COMPOSE_CMD := docker compose -f $(COMPOSE_FILE)

DC_POSTGRES := $(PROJECT_NAME)_postgres
DC_BACKEND  := $(PROJECT_NAME)_backend

.PHONY: all info up build down down-v ps logs reset restart \
        up-prod down-prod \
        db-export verify-db format format-backend format-frontend \
        lint lint-backend lint-frontend type-check test frontend-build audit \
        install-local-dev run-local-dev clean help

info: ## Show current system configuration
	@echo "========================================"
	@echo "  SYSTEM CONFIGURATION"
	@echo "OS Detected    : $(OS)"
	@echo "Project Name   : $(PROJECT_NAME)"
	@echo "Venv Path      : $(BACKEND_VENV)"
	@echo "Active Compose : $(COMPOSE_FILE)"
	@echo "Target DB      : $(POSTGRES_DB)"
	@echo "========================================"

up: ## Start infrastructure (Detached)
	@echo "Starting Docker infrastructure using $(COMPOSE_FILE)..."
	@$(COMPOSE_CMD) up -d

down: ## Stop containers (Preserve volumes)
	@echo "Stopping infrastructure..."
	@$(COMPOSE_CMD) down

up-prod: ## Start Enterprise Production infrastructure (Detached & Build)
	@echo "Starting Enterprise Production infrastructure..."
	@docker compose -f docker-compose.prod.yml up -d --build

down-prod: ## Stop Enterprise Production infrastructure
	@echo "Stopping Enterprise Production infrastructure..."
	@docker compose -f docker-compose.prod.yml down

down-v: ## Stop containers and DESTROY persistent volumes (Data Loss)
	@echo "Removing containers and volumes..."
	@$(COMPOSE_CMD) down -v --remove-orphans

ps: ## Show running containers
	@$(COMPOSE_CMD) ps

logs: ## Stream logs from all services
	@$(COMPOSE_CMD) logs -f

reset: ## Full clean reset: Wipes data, Rebuilds containers, and Re-inits DB
	@$(MAKE) down-v
	@echo "Rebuilding and Initializing Infrastructure..."
	@$(COMPOSE_CMD) up -d --build
	@echo "Reset complete. System initialized from $(COMPOSE_FILE)."

restart: ## Restart containers (Preserves Data & No Rebuild)
	@echo "Restarting infrastructure..."
	@$(MAKE) down
	@$(MAKE) up
	@echo "Restart complete. Use 'make logs' to monitor."

db-export: ## Export current database state to _db_scripts/
	@chmod +x ./_scripts/db/export_db.sh
	@./_scripts/db/export_db.sh

verify-db: ## FORCE Restore DB from ./_db_scripts/in_use_backup.sql (Destructive)
	@$(MAKE) db-import

db-import:
	@chmod +x ./_scripts/db/import_db.sh
	@./_scripts/db/import_db.sh

db-inspect:
	@chmod +x _scripts/db/inspect_legacy.sh
	@./_scripts/db/inspect_legacy.sh

db-shell: ## Interactive PSQL shell inside the container
	@docker exec -it $(DC_POSTGRES) psql -U $(POSTGRES_USER) -d $(POSTGRES_DB)

db-migrate: ## Generate a new migration (Usage: make db-migrate m="message")
	@if [ -z "$(m)" ]; then \
		echo "[ERROR] Migration message is required. Usage: make db-migrate m=\"message\""; \
		exit 1; \
	fi
	@echo "[ALEMBIC] Generating new migration: $(m)..."
	@docker exec -it $(DC_BACKEND) alembic revision --autogenerate -m "$(m)"

db-upgrade: ## Apply all pending migrations to HEAD
	@echo "[ALEMBIC] Applying pending migrations to HEAD..."
	@docker exec -it $(DC_BACKEND) alembic upgrade head

db-downgrade: ## Roll back last migration (-1)
	@echo "[ALEMBIC] Rolling back last migration (-1)..."
	@docker exec -it $(DC_BACKEND) alembic downgrade -1

db-current: ## Show current active revision
	@echo "[ALEMBIC] Checking current database revision..."
	@docker exec -it $(DC_BACKEND) alembic current

db-history: ## Show complete migration log
	@echo "[ALEMBIC] Showing migration history..."
	@docker exec -it $(DC_BACKEND) alembic history

export-project:
	@python3 _scripts/dev/export_project.py

format-backend: ## Auto-format Python code (Ruff)
	@echo "[BACKEND] Formatting code..."
	@$(LOCAL_PYTHON) -m ruff format $(BACKEND_ROOT)

format-frontend: ## Auto-format React code (Prettier)
	@echo "[FRONTEND] Formatting code..."
	@cd $(FRONTEND_ROOT) && npm run format

format: format-backend format-frontend ## Run all code formatters

lint-backend: ## Static analysis and auto-fix (Ruff)
	@echo "[BACKEND] Linting code..."
	@$(LOCAL_PYTHON) -m ruff check $(BACKEND_ROOT) --fix

lint-frontend: ## Static analysis (ESLint)
	@echo "[FRONTEND] Linting code..."
	@cd $(FRONTEND_ROOT) && npm run lint

type-check: ## Strict type validation (Mypy)
	@echo "[BACKEND] Checking types (Strict Mode)..."
	@cd $(BACKEND_ROOT) && $(PYTHON_EXEC) -m mypy .

test: ## Run unit and integration tests (Pytest)
	@echo "[BACKEND] Running test suite..."
	@cd backend && ENVIRONMENT=testing python -m pytest -v

frontend-build: ## Verify Frontend compilation (Strict Check)
	@echo "[FRONTEND] Verifying production build integrity..."
	@cd $(FRONTEND_ROOT) && npm run build

audit:
	@start_time=$$(date +%s.%N); \
	$(MAKE) audit-backend audit-frontend; \
	EXIT_CODE=$$?; \
	end_time=$$(date +%s.%N); \
	duration=$$(echo "$$end_time $$start_time" | awk '{print $$1 - $$2}'); \
	echo "========================================"; \
	if [ $$EXIT_CODE -eq 0 ]; then \
		printf "AUDIT PASSED in %.2f seconds\n" $$duration; \
	else \
		printf "AUDIT FAILED in %.2f seconds\n" $$duration; \
		exit $$EXIT_CODE; \
	fi

audit-backend:
	@echo "[BACKEND] Pipeline Start..."
	@$(MAKE) format-backend
	@$(MAKE) lint-backend
	@$(MAKE) type-check
	@$(MAKE) test
	@echo "[BACKEND] Pipeline Finished."

audit-frontend:
	@echo "[FRONTEND] Pipeline Start..."
	@cd $(FRONTEND_ROOT) && [ -d "node_modules" ] || npm ci --silent
	@$(MAKE) -j3 format-frontend lint-frontend frontend-build
	@echo "[FRONTEND] Pipeline Finished."

install-local-dev: ## Install full dev stack (Backend + Frontend)
	@echo "[1/4] Initializing Python Virtual Environment..."
	@cd $(BACKEND_ROOT) && $(PYTHON_EXEC) -m venv .venv || true
	@echo "[2/4] Upgrading Pip and installing backend deps..."
	@$(LOCAL_PIP) install --upgrade pip
	@cd $(BACKEND_ROOT) && $(LOCAL_PIP) install -e ".[dev]"
	@echo "[3/4] Installing Frontend dependencies..."
	@cd $(FRONTEND_ROOT) && npm install
	@echo "[4/4] Environment Ready."

run-local-dev: ## Run Backend API locally (Hot Reload)
	@echo "Starting FastAPI locally..."
	@PYTHONPATH=$(BACKEND_SRC) $(LOCAL_PYTHON) -m uvicorn app:app --app-dir $(BACKEND_SRC) --host 0.0.0.0 --port 8000 --reload

clean: ## Remove build artifacts and caches
	@echo "Cleaning temporary files..."
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null
	@find . -type d -name ".pytest_cache" -exec rm -rf {} + 2>/dev/null
	@find . -type d -name ".mypy_cache" -exec rm -rf {} + 2>/dev/null
	@find . -type d -name ".ruff_cache" -exec rm -rf {} + 2>/dev/null
	@find . -type d -name "dist" -exec rm -rf {} + 2>/dev/null
	@find . -type f -name "*.pyc" -delete 2>/dev/null
	@find . -type f -name ".eslintcache" -delete 2>/dev/null
	@echo "Clean complete."

help: ## Show this help message
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-25s %s\n", $$1, $$2}'
