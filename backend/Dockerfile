ARG PYTHON_VERSION=3.13
FROM python:${PYTHON_VERSION}-slim-bookworm AS builder

# 1. System Deps for building Python packages
RUN apt-get update && apt-get install -y \
    curl gcc g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV PIP_ROOT_USER_ACTION=ignore

# 2. Project Setup (No database/alembic needed)
COPY pyproject.toml README.md ./
COPY src ./src

# 3. Install Dependencies with Cache Mount
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip && \
    pip install --default-timeout=5600 --retries=10 .

# --- FINAL STAGE ---
FROM python:${PYTHON_VERSION}-slim-bookworm

# 1. Install VNC, RPA (PyAutoGUI/OpenCV), and Chromium dependencies
RUN apt-get update && apt-get install -y \
    curl xvfb x11vnc fluxbox novnc websockify \
    scrot python3-tk x11-utils libglib2.0-0 \
    chromium \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Create unprivileged user and profile directories
RUN useradd -m -u 1000 appuser && \
    mkdir -p /data/profiles/active && \
    chown -R appuser:appuser /app /data

# 3. Copy artifacts from builder
COPY --from=builder /usr/local/lib/python3.13/site-packages/ /usr/local/lib/python3.13/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/
COPY --from=builder /app /app

# 4. Copy and prepare the entrypoint script
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh && chown appuser:appuser entrypoint.sh

USER appuser

# 5. Environment configuration (CRITICAL: DISPLAY=:99 for PyAutoGUI)
ENV PYTHONPATH=/app/src \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DISPLAY=:99

EXPOSE 8000 5900 6080

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# 6. Use the entrypoint to orchestrate Xvfb and FastAPI
ENTRYPOINT ["/app/entrypoint.sh"]