#!/bin/bash
# Script to safely launch Google Chrome inside the Docker VNC environment

echo "[INFO] Limpiando bloqueos previos del perfil (Anti-Crash)..."
# Eliminar candados de perfil para evitar el error "profile appears to be in use"
rm -f /data/profiles/active/SingletonLock
rm -f /data/profiles/active/SingletonCookie
rm -f /data/profiles/active/SingletonSocket

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

# Esperar a que el proceso levante la ventana y forzar maximización a nivel Gestor de Ventanas (Fluxbox)
sleep 3
if command -v wmctrl &> /dev/null; then
    echo "[INFO] Forzando maximización de la ventana en Xvfb..."
    wmctrl -r "Google Chrome" -b add,maximized_vert,maximized_horz || true
else
    echo "[WARN] 'wmctrl' no está instalado. La maximización forzada podría fallar."
fi