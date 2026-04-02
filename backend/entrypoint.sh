#!/bin/bash
set -e

echo "[INFO] Cleaning up previous X/VNC sessions..."
rm -f /tmp/.X99-lock

echo "[INFO] Creating dummy .Xauthority to prevent Xlib crash..."
touch ~/.Xauthority

echo "[INFO] Starting Xvfb on DISPLAY :99..."
Xvfb :99 -screen 0 1366x768x24 &
sleep 2

echo "[INFO] Starting lightweight Window Manager (Fluxbox)..."
fluxbox &
sleep 1

echo "[INFO] Starting x11vnc on port 5900..."
x11vnc -display :99 -nopw -listen 0.0.0.0 -xkb -forever -bg

echo "[INFO] Starting websockify for noVNC on port 6080..."
websockify --web /usr/share/novnc/ 6080 localhost:5900 &
sleep 1

echo "[INFO] Starting FastAPI Application..."
# Se asume que tu API está en src/server_api.py y expone el objeto "app"
exec uvicorn src.server_api:app --host 0.0.0.0 --port 8000 --reload