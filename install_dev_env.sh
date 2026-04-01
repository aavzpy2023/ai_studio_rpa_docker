#!/bin/bash
# ==============================================================================
# BOOTSTRAPPER - LINUX & MAC
# Mission:
#   1. Configure local environment.
#   2. Setup NVIDIA GPU Support (Critical for local AI).
#   3. Launch infrastructure.
# ==============================================================================

# --- COLORS ---
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }
log_success() { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }
log_phase() { echo -e "\n${CYAN}=== $1 ===${NC}"; }

OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN";;
esac

echo ""
echo " ======================================================="
echo "      AI ASSISTANT - UNIVERSAL INSTALLER ($MACHINE)"
echo " ======================================================="

# ----------------------------------------------------------
# PHASE 0: PREPARING CONFIGURATION (.ENV)
# ----------------------------------------------------------
log_phase "PHASE 0: Verifying secrets and configuration"

if [ ! -f .env ]; then
    if [ -f .env.example ]; then
        cp .env.example .env
        if [ "$MACHINE" == "Mac" ]; then
            sed -i '' 's/ENVIRONMENT=development.*/ENVIRONMENT=development/' .env
        else
            sed -i 's/ENVIRONMENT=development.*/ENVIRONMENT=development/' .env
        fi
        log_success ".env file generated and sanitized."
    else
        log_error ".env.example not found. Cannot proceed."
        exit 1
    fi
else
    log_success ".env file already exists."
fi

# ----------------------------------------------------------
# PHASE 1: LOCAL ENVIRONMENT (PYTHON 3.13)
# ----------------------------------------------------------
log_phase "PHASE 1: Configuring local environment (For IDE)"

PYTHON_BIN=""
if command -v python3.13 &> /dev/null; then
    PYTHON_BIN="python3.13"
elif command -v python3 &> /dev/null; then
    VER=$(python3 --version 2>&1)
    if [[ "$VER" == *"3.13"* ]]; then
        PYTHON_BIN="python3"
    fi
fi

if [ -z "$PYTHON_BIN" ]; then
    log_warn "Python 3.13 not detected. IDE autocomplete might fail."
else
    log_info "Using: $PYTHON_BIN"
    if [ ! -d ".venv" ]; then
        log_info "Creating .venv directory..."
        $PYTHON_BIN -m venv .venv
    fi

    # Install dependencies quietly
    VENV_PIP="./.venv/bin/pip"
    $VENV_PIP install --upgrade pip > /dev/null 2>&1
    $VENV_PIP install -e ".[dev]" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        log_success "Local environment ready."
    fi
fi

# ----------------------------------------------------------
# PHASE 1.5: NVIDIA GPU SETUP (Linux Only)
# ----------------------------------------------------------
if [ "$MACHINE" == "Linux" ]; then
    log_phase "PHASE 1.5: Checking GPU Capabilities"

    # Check if NVIDIA hardware exists
    if lspci | grep -i nvidia > /dev/null; then
        log_info "NVIDIA Hardware detected."

        # Check if Docker can see the GPU
        if ! docker info | grep -i "Runtimes.*nvidia" > /dev/null; then
            log_warn "Docker does not support NVIDIA runtime yet."

            echo -e "${YELLOW}Do you want to install nvidia-container-toolkit? (Requires sudo) [y/n]${NC}"
            read -r install_gpu

            if [[ "$install_gpu" =~ ^([yY][eE][sS]|[yY])$ ]]; then
                log_info "Setting up NVIDIA Container Toolkit repository..."

                # 1. Add Repository (Standard procedure for Stable)
                curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
                && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
                sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#' | \
                sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list > /dev/null

                # 2. Install
                sudo apt-get update
                sudo apt-get install -y nvidia-container-toolkit

                # 3. Configure Docker
                log_info "Configuring Docker Daemon..."
                sudo nvidia-ctk runtime configure --runtime=docker
                sudo systemctl restart docker

                log_success "GPU Support installed. Docker restarted."
            else
                log_warn "Skipping GPU setup. Ollama will run in CPU-only mode (Slow)."
            fi
        else
            log_success "NVIDIA Container Toolkit is already active."
        fi
    else
        log_info "No NVIDIA GPU detected. Skipping."
    fi
fi

# ----------------------------------------------------------
# PHASE 2: RUNTIME ENVIRONMENT (DOCKER)
# ----------------------------------------------------------
log_phase "PHASE 2: Launching Infrastructure"

if ! docker info > /dev/null 2>&1; then
    log_error "Docker is not running."
    exit 1
fi

log_info "Building containers (using local image if available)..."
docker-compose up --build -d

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}  MISSION ACCOMPLISHED${NC}"
    echo "  1. API:  http://localhost:8000/docs"
    echo "  2. UI:   http://localhost:8501"
    echo ""
else
    log_error "Docker failed to start."
    exit 1
fi
