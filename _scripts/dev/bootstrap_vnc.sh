#!/bin/bash
# Headless VNC Bootstrap for AI Studio Authentication
# Run this inside the backend container to spawn a VNC session and login manually.

ACCOUNT_ID=$1
if [ -z "$ACCOUNT_ID" ]; then
    echo "[ERROR] Usage: ./bootstrap_vnc.sh <account_id>"
    echo "Example: ./bootstrap_vnc.sh acc_123"
    exit 1
fi

PROFILE_DIR="/data/profiles/cache/$ACCOUNT_ID"
echo "[INFO] Ensuring profile directory exists: $PROFILE_DIR"
mkdir -p "$PROFILE_DIR"

# Terminate existing sessions to avoid port collision
echo "[INFO] Cleaning up previous X/VNC sessions..."
pkill -f Xvfb
pkill -f x11vnc
pkill -f fluxbox
pkill -f websockify
rm -f /tmp/.X99-lock

export DISPLAY=:99

echo "[INFO] Starting Xvfb on DISPLAY :99..."
Xvfb :99 -screen 0 1280x800x24 &
sleep 2

echo "[INFO] Starting lightweight Window Manager (Fluxbox)..."
fluxbox &
sleep 1

echo "[INFO] Starting x11vnc on port 5900..."
x11vnc -display :99 -nopw -listen 0.0.0.0 -xkb -forever &
sleep 2

echo "[INFO] Starting websockify for noVNC..."
websockify --web /usr/share/novnc/ 6080 localhost:5900 &
sleep 1

echo "[INFO] Launching Playwright Chromium Headful Session..."
python -c "
import asyncio
from playwright.async_api import async_playwright

async def main():
    print('[INFO] Starting Playwright...')
    async with async_playwright() as p:
        browser = await p.chromium.launch_persistent_context(
            user_data_dir='$PROFILE_DIR',
            headless=False,
            viewport={'width': 1280, 'height': 800},
            args=['--no-sandbox', '--disable-dev-shm-usage', '--disable-gpu']
        )
        page = await browser.new_page()
        await page.goto('https://aistudio.google.com/app/prompts/new_chat')
        print('[SUCCESS] Browser launched! Connect your VNC client to 127.0.0.1:5900')
        print('[INFO] Complete the Google Login flow. Press Ctrl+C in this terminal when finished to persist the state.')
        
        # Keep the script alive to allow manual interaction
        try:
            while True:
                await asyncio.sleep(3600)
        except asyncio.CancelledError:
            pass

asyncio.run(main())
"
