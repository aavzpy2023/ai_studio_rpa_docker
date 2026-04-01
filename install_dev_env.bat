@echo off
setlocal EnableDelayedExpansion

:: ==========================================================
::           BOOTSTRAPPER - WINDOWS (GPU AWARE)
:: ==========================================================

echo.
echo  =======================================================
echo           AI ASSISTANT - UNIVERSAL INSTALLER
echo  =======================================================
echo.

:: ----------------------------------------------------------
:: PHASE 0: CONFIGURATION
:: ----------------------------------------------------------
echo [PHASE 0] Verifying configuration...

if not exist .env (
    if exist .env.example (
        copy .env.example .env >nul
        powershell -Command "(Get-Content .env) -replace 'ENVIRONMENT=development.*', 'ENVIRONMENT=development' | Set-Content .env"
        echo    [OK] .env generated.
    ) else (
        echo    [ERROR] .env.example missing.
        goto :ERROR_EXIT
    )
) else (
    echo    [SKIP] .env exists.
)

:: ----------------------------------------------------------
:: PHASE 1: LOCAL ENVIRONMENT
:: ----------------------------------------------------------
echo.
echo [PHASE 1] Local Setup...

py -3.13 --version >nul 2>&1
if !errorlevel! equ 0 (
    if not exist .venv (
        echo    [INFO] Creating .venv...
        py -3.13 -m venv .venv
    )
    .\.venv\Scripts\pip install --upgrade pip >nul 2>&1
    .\.venv\Scripts\pip install -e ".[dev]" >nul 2>&1
    echo    [OK] Dependencies installed.
) else (
    echo    [WARN] Python 3.13 not found. Skipping local setup.
)

:: ----------------------------------------------------------
:: PHASE 1.5: GPU CHECK (WINDOWS)
:: ----------------------------------------------------------
echo.
echo [PHASE 1.5] Checking GPU...

nvidia-smi >nul 2>&1
if !errorlevel! equ 0 (
    echo    [OK] NVIDIA GPU detected via nvidia-smi.
    echo    [INFO] Ensure Docker Desktop is using WSL 2 backend.
) else (
    echo    [WARN] NVIDIA GPU not detected or drivers missing.
    echo           Ollama will run in CPU mode (Slower).
)

:: ----------------------------------------------------------
:: PHASE 2: LAUNCH
:: ----------------------------------------------------------
echo.
echo [PHASE 2] Launching Docker...

docker info >nul 2>&1
if !errorlevel! neq 0 (
    echo    [ERROR] Docker Desktop is not running.
    goto :ERROR_EXIT
)

docker-compose up --build -d

if !errorlevel! equ 0 (
    echo.
    echo   MISSION ACCOMPLISHED
    echo   API: http://localhost:8000/docs
    echo   UI:  http://localhost:8501
    echo.
) else (
    echo    [ERROR] Docker failed.
    goto :ERROR_EXIT
)

pause
exit /b 0

:ERROR_EXIT
echo [FATAL] Error occurred.
pause
exit /b 1
