#!/bin/bash
# Script to connect to OpenVPN (ProtonVPN) inside the Docker container

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
AUTH_FILE="$DIR/auth.txt"

# 1. Select OVPN file automatically if not provided
if [ -z "$1" ]; then
    # Find all .ovpn files in the script's directory
    OVPN_FILES=("$DIR"/*.ovpn)
    
    # Check if files exist (handles the case where the glob fails)
    if [ ${#OVPN_FILES[@]} -eq 0 ] || [ ! -e "${OVPN_FILES[0]}" ]; then
        echo "[ERROR] No se encontraron archivos .ovpn en $DIR"
        exit 1
    fi
    
    # Select a random file from the array for load balancing
    RANDOM_INDEX=$((RANDOM % ${#OVPN_FILES[@]}))
    OVPN_FILE="${OVPN_FILES[$RANDOM_INDEX]}"
    echo "[INFO] Archivo no especificado. Servidor seleccionado aleatoriamente: $(basename "$OVPN_FILE")"
else
    OVPN_FILE="$1"
fi

if [ ! -f "$OVPN_FILE" ]; then
    echo "[ERROR] El archivo '$OVPN_FILE' no existe."
    exit 1
fi

# 2. Auto-patch the .ovpn file to use auth.txt dynamically
if [ -f "$AUTH_FILE" ]; then
    # If the file just says "auth-user-pass" without a path, replace it
    if grep -qE "^auth-user-pass$" "$OVPN_FILE"; then
        echo "[INFO] Inyectando credenciales automáticas en $(basename "$OVPN_FILE")..."
        sed -i "s|^auth-user-pass$|auth-user-pass $AUTH_FILE|g" "$OVPN_FILE"
    fi
else
    echo "[WARNING] No se encontró $AUTH_FILE en $DIR. La VPN pedirá credenciales."
fi

# 3. Prevent duplicate connections
echo "[INFO] Limpiando conexiones VPN previas..."
sudo killall openvpn 2>/dev/null || true
sleep 2

# 4. Connect
echo "[INFO] Conectando a VPN usando $(basename "$OVPN_FILE")..."
sudo openvpn --config "$OVPN_FILE" --daemon

echo "[INFO] Esperando 8 segundos para establecer la conexión..."
sleep 8

echo "[INFO] Nueva IP pública:"
curl -s ifconfig.me || echo "[ERROR] No se pudo obtener la IP. ¿Falló la conexión?"
echo ""