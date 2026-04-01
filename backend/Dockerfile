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

# 1. Install VNC, RPA, and VPN (ProtonVPN/OpenVPN) dependencies
RUN apt-get update && apt-get install -y \
    curl wget gnupg xvfb x11vnc fluxbox novnc websockify \
    scrot python3-tk x11-utils libglib2.0-0 \
    openvpn iptables iproute2 dialog resolvconf sudo \
    && rm -rf /var/lib/apt/lists/*

# 1.2 Install Official Google Chrome (Matches Desktop Stable Channel)
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

# 1.5 Add ProtonVPN Official Repository and install CLI
RUN wget -qO - https://repo.protonvpn.com/debian/public_key.asc | tee /etc/apt/trusted.gpg.d/protonvpn.asc && \
    echo "deb https://repo.protonvpn.com/debian stable main" > /etc/apt/sources.list.d/protonvpn.list && \
    apt-get update && apt-get install -y protonvpn-cli \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 2. Create unprivileged user, configure sudo for VPN, and set directories
RUN useradd -m -u 1000 appuser && \
    echo "appuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/appuser && \
    chmod 0440 /etc/sudoers.d/appuser && \
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