# Hexagonal AI Assistant (D-SaaS: Decision-Support as a Service)

<div>

[![Python](https://img.shields.io/badge/Python-3.13-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-1.0.0-009688?style=flat-square&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![React](https://img.shields.io/badge/React-18.3-61DAFB?style=flat-square&logo=react&logoColor=white)](https://react.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.5-3178C6?style=flat-square&logo=typescript&logoColor=white)](https://www.typescriptlang.org/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-17-336791?style=flat-square&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker-Production_Ready-2496ED?style=flat-square&logo=docker&logoColor=white)](https://www.docker.com/)
[![Ollama](https://img.shields.io/badge/AI-Ollama_qwen3-000000?style=flat-square&logo=ollama&logoColor=white)](https://ollama.ai/)
[![Architecture](https://img.shields.io/badge/Architecture-Hexagonal_Modular-FF6B6B?style=flat-square&logo=hexagon&logoColor=white)](https://alistair.cockburn.us/hexagonal-architecture/)
[![Quality](https://img.shields.io/badge/Quality-Strict_Audit-green?style=flat-square)](https://docs.astral.sh/ruff/)

**High-performance local AI orchestration system, engineered with Domain-Driven Design (DDD) principles and Modular Hexagonal Architecture for socio-economic decision support.**

</div>

---

## 📋 Overview

This project implements a robust, decoupled ecosystem for AI-driven analytical decision support. Designed through the lens of **Quantitative Engineering**, this solution moves beyond experimental notebooks to a production-grade infrastructure suitable for sensitive domains like **Public Health Economics** and **Policy Modeling**.

### Key Strategic Features
*   **Modular Hexagonal Core:** Business logic is isolated from technical volatility, ensuring that mathematical models remain consistent regardless of changes in the database or UI.
*   **Advanced Security (JWT + Bcrypt):** Enterprise-grade authentication flow using a custom `JwtAdapter` and `BcryptAdapter`, with strict separation between plaintext `UserPassword` and domain `HashedPassword`.
*   **Local-First AI Privacy:** Native integration with **Ollama** for on-premise LLM execution, crucial for projects involving confidential public health data.
*   **Reactive Analytical UI:** A professional dashboard built with **React 18** and **Vite**, optimized for low-latency interactions and complex data visualization.
*   **Zero-Defect Engineering:** Continuous quality enforcement via `make audit` (Ruff, Mypy, Pytest) ensuring **Military-Grade** code reliability.

---

## 🏗 System Architecture

The ecosystem is partitioned into a **Modular Hexagonal Architecture** (Vertical Slicing), facilitating independent scaling of functional domains:

```text
ai_assistant/
├── backend/src/            # 🚀 PYTHON HEXAGONAL CORE
│   ├── messages/           # [MODULE] AI Interaction & Context Management
│   │   ├── domain/         #    - Aggregate: Message, VOs: Content, Role
│   │   ├── application/    #    - Use Cases: AskAssistant, ClearHistory
│   │   └── infrastructure/ #    - Driven: OllamaAdapter, PostgresRepo
│   │
│   ├── users/              # [MODULE] Auth & Identity Management
│   │   ├── domain/         #    - Aggregate: User, VOs: HashedPassword, Email
│   │   ├── application/    #    - Use Cases: RegisterUser, LoginUser
│   │   └── infrastructure/ #    - Driven: JWTAdapter, BcryptAdapter
│   │
│   ├── shared/             # [KERNEL] Reusable Domain & Infra foundations
│   └── infrastructure/     # [GLOBAL] DI Container (Kink) & App Entrypoint
│
├── frontend-react/         # ⚛️ MODERN REACT DASHBOARD
│   ├── src/                #    - Atomic Components & Hexagonal Services
│   └── tsconfig.json       #    - Pinned TS 5.5.3 (Linter Stability)
│
└── docker-compose.yml      # 🐳 FULL-STACK ORCHESTRATION
```



## ⚡ Rapid Setup (Automated)

We provide "One-Click" bootstrapper scripts that handle:

1. **Environment Config:** Generation and sanitization of `.env` files.
2. **Python Environment:** Setup of Python 3.13 & Virtual Environment (for local IDE support).
3. **Infrastructure:** Launching of the full Docker stack (Database, API, AI, Frontend).

### 🐧 Linux / macOS

```bash
  chmod +x install_dev_env.sh
```
```bash
  ./install_dev_env.sh
```

### 🪟 Windows

Double-click install_dev_env.bat or run in CMD:
```bash
install_dev_env.bat
```

### 🚀 Development Setup

1. **Configure Local Environment:**
   ```bash
   cp .env.example .env
   cp Makefile.local.example Makefile.local
   ```
    NOTE: The file docker-compose_dev.yml must exist in the root path.  

## 🛠️ Development Workflow (The Makefile)

Once the environment is set up, use the Master Makefile to manage the project lifecycle.
Command	Description

    Command	Description
Lifecycle	

    make up	Starts the full infrastructure (API, DB, Ollama, UI) in detached mode via Docker Compose.

    make down	Stops and removes containers defined in the main Compose file.
    
    make up-prod	Deploys the Enterprise Production environment using immutable builds and Nginx Gateway.

    make down-prod	Stops the Enterprise Production infrastructure.
        
    make down-v	Deep Clean: Stops containers and removes persistent volumes (wipes the Dev DB).

    make logs	Streams real-time logs from all active services.

    make ps	        Displays the current status of all running containers.

    make audit	The Gatekeeper. Runs the full quality pipeline: Format, Lint, Type Check (MyPy), and Tests.

    make format	Executes ruff format to ensure code style consistency.

    make lint	Executes ruff check to catch stylistic errors and bugs (with auto-fix).

    make type-check	Runs static type analysis (mypy) against the src/ directory.

    make test	Executes the test suite using pytest -v.

    make clean	Removes build artifacts and caches (__pycache__, .ruff_cache, etc.).
    
    make install-local-dev	Installs project dependencies into the local .venv (for IDE autocompletion).
    
    make run-local-dev	Runs the FastAPI server locally (host machine) with hot-reload enabled.

## 📥 AI Model Provisioning

*(Note: This step is only required for the **Development** environment. The Production environment auto-provisions models using a sidecar container).*

After starting the dev services (`make up`), you must manually download the LLM model into the Ollama container. Ensure the model matches your `OLLAMA_MODEL` in `.env`:

```bash
  docker exec ai_assist_ollama ollama pull qwen3:1.7b
  
  docker exec ai_assist_ollama ollama pull nomic-embed-text
```

## 💾 Database Management

The system uses PostgreSQL 17. The schema is automatically synchronized on startup via SQLAlchemy.

### 📋 Prerequisites for Auditing
Before running the audit pipeline, you must establish the local development environment. The QA tools (Ruff, Mypy, Pytest) run locally to provide immediate feedback loop.

1.  **Ensure Python 3.13+ is installed.**
2.  **Install Development Dependencies:**
    ```bash
    make install-local-dev
    ```
    *(This creates a local `.venv` and installs Ruff, Mypy, and Pytest).*

### 🚀 Running the Pipeline
To validate your code against the strict quality gate before pushing:

```bash
make audit
```
This command executes the following F.I.R.S.T. principle pipeline:

    Component	        Tool	            Purpose
    
    Auto-Formatting	        Ruff Format	    Enforces consistent code style automatically.
    
    Linting	                Ruff Check	    Detects and fixes structural errors and bad practices.
    
    Type Safety	        Mypy (Strict)	    Validates static type definitions across src/ to prevent runtime errors.
    
    Testing	                Pytest	            Runs Unit Tests (using Fakes) and Integration Tests.

### 🌍 Enterprise Production Deployment

The project is equipped with a Twelve-Factor compatible production architecture (`docker-compose.prod.yml`). To deploy the system in a production environment:

```bash
make up-prod
```

### Production Architecture Highlights:

- **Unified API Gateway (Nginx)**: All traffic is routed through a single entrypoint (Port 80), natively eliminating CORS issues.

- **Immutable Images**: Frontend React is statically compiled, and the Python Backend is stripped of dev-dependencies.

- **AI Auto-Provisioning**: A sidecar container (ollama_init) automatically waits for GPU readiness and pulls required LLM/Embedding weights.

- **Zero-Downtime Migrations**: An ephemeral backend_migrator container securely applies database schemas before the main API boots.

- **Uvicorn Workers**: The API runs with optimized concurrent workers (--workers 4) for high-throughput AI inference

### 🌐 System Access Points
Once the infrastructure is running via make up, the following services are available:
    
    Service	                URL	                        Description

    Frontend Application	http://localhost:3000	        The React-based Chat Interface.

    API Documentation	http://localhost:8000/docs	Swagger/OpenAPI interactive documentation.
    
    N8N Automation	        http://localhost:5678	        Workflow automation engine (Credentials in .env).


