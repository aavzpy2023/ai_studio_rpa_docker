# PROJECT CONTEXT: AIStudioPooler (Multi-Account AI Studio Proxy)

## 1. PROJECT OVERVIEW

**Name:** AIStudioPooler
**Type:** Intelligent Reverse Proxy & Headless Browser Orchestrator.
**Goal:** Automate interactions with `aistudio.google.com` using Playwright, managing a pool of free Google accounts to bypass daily rate limits via transparent rotation. It provides a seamless Chat UI (React) that mimics standard LLM interfaces while hiding the complex browser orchestration and account switching happening in the backend.

## 2. DOMAIN MODULES

The backend is structured using Hexagonal Architecture (Domain-Driven Design). Cross-module imports are strictly prohibited unless done via shared application use-cases or strict domain interfaces.

- `accounts`: Manages the Account State Machine (Initial: `requires_auth` -> Verified: `available` -> `in_use` -> `limit_reached`), daily limit heuristics, and rotation algorithms.
- `browser`: The Infrastructure layer (Driven Port) that orchestrates Playwright headless contexts and atomic File System I/O operations for persistent Google profiles. Features resilient DOM parsing for AI Studio (Angular UI).
- `chat`: Manages Conversations, Messages, token scraping logic, and File attachments handling via integrated Application Use Cases.

## 3. CRITICAL ARCHITECTURAL RULES

- **Profile I/O & Concurrency (CRITICAL):** Google session profiles physically reside in `/data/profiles/cache` and `/data/profiles/active`. To prevent session corruption, the database MUST use Pessimistic Locking (`SELECT FOR UPDATE` on the `account` row) BEFORE any `shutil` operation moves a profile between directories.
- **RAM Protection (Anti-OOM):** The system allows a maximum of 4 active headless browsers simultaneously. Playwright MUST intercept and abort network requests for `image` and `media` resources to keep RAM usage under 500MB per context. (`font` and `stylesheet` are allowed to ensure Angular streaming functions properly).
- **Resilient DOM Scraping:** AI Studio's UI changes frequently. Playwright interactions MUST use arrays of fallback selectors and include exponential backoff retries. If token scraping fails, it gracefully returns `null` rather than crashing the chat flow.
- **Headless Bootstrapping:** For initial Google logins (which require CAPTCHA/2FA), the system uses an `Xvfb` + `x11vnc` bridge, allowing admins to connect via VNC and authenticate manually to seed the `cache/` profiles.

## 4. STACK SUMMARY

- **Backend:** Python 3.13, FastAPI, Pydantic V2, PyAutoGUI, OpenCV (Headless Vision), Kink (DI).
- **Database:** N/A (Stateless / File System driven).
- **Frontend:** React 19, TypeScript, Vite, TailwindCSS (v3.4.3), TanStack Query (v5+ for Server State), Zustand (Optimistic UI for Chat), React Markdown.
- **Infrastructure:** Docker, Docker Compose (Multi-tenant RPA bots ports 8010+), Nginx, Xvfb, Fluxbox, x11vnc, noVNC (websockify).
