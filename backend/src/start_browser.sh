#!/bin/bash
# Script to safely launch Google Chrome inside the Docker VNC environment

echo "[INFO] Iniciando Google Chrome..."

# Ensure we target the correct virtual display
export DISPLAY=:99

# Launch Chrome in background with Docker-safe flags, forced resolution, and persistent profile
google-chrome \
    --no-sandbox \
    --disable-dev-shm-usage \
    --window-size=1366,768 \
    --start-maximized \
    --user-data-dir=/data/profiles/active \
    --disable-blink-features=AutomationControlled \
    "$@" &

echo "[INFO] Chrome ejecutándose en segundo plano."