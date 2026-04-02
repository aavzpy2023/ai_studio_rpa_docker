#!/bin/bash
# Script to connect to OpenVPN (ProtonVPN) with Multi-Auth and Failover Protocol
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Resolve Auth File via Environment Variable (Allows isolated container identities)
# Use VPN_AUTH_ID=1 or VPN_AUTH_ID=2 in your docker-compose.yml
VPN_AUTH_ID="${VPN_AUTH_ID:-1}"
AUTH_FILE="$DIR/auth${VPN_AUTH_ID}.txt"

if [ ! -f "$AUTH_FILE" ]; then
    echo "[FATAL] El archivo de autenticación no existe: $AUTH_FILE"
    exit 1
fi

# 2. Discover and Shuffle OVPN Files for Load Balancing
OVPN_FILES=("$DIR"/*.ovpn)
if [ ${#OVPN_FILES[@]} -eq 0 ] || [ ! -e "${OVPN_FILES[0]}" ]; then
    echo "[FATAL] No se encontraron archivos .ovpn en $DIR"
    exit 1
fi

# Create a randomized array of available servers
mapfile -t SHUFFLED_FILES < <(shuf -e "${OVPN_FILES[@]}")

# 3. Failover Loop Execution
SUCCESS=0
for OVPN_FILE in "${SHUFFLED_FILES[@]}"; do
    echo "[INFO] ==================================================="
    echo "[INFO] 🚀 Intentando conexión VPN..."
    echo "[INFO] 📍 Servidor: $(basename "$OVPN_FILE")"
    echo "[INFO] 🔑 Identidad: $AUTH_FILE"
    
    # Clean previous zombie instances
    sudo killall openvpn 2>/dev/null || true
    sleep 2
    
    # [ANTI-RACE-CONDITION]: Isolate config to /tmp/ to prevent shared volume corruption
    TMP_CONF="/tmp/active_vpn_${VPN_AUTH_ID}.conf"
    cp "$OVPN_FILE" "$TMP_CONF"
    
    # Strip any existing auth-user-pass directives and inject the absolute isolated path
    sed -i '/^auth-user-pass/d' "$TMP_CONF"
    echo "auth-user-pass $AUTH_FILE" >> "$TMP_CONF"
    
    # Connect
    sudo openvpn --config "$TMP_CONF" --daemon
    
    echo "[INFO] ⏳ Esperando 10 segundos para estabilización del túnel..."
    sleep 10
    
    # 4. Deep Connection Validation
    # Check 1: Does the interface tun0 exist?
    if ip link show tun0 > /dev/null 2>&1; then
        echo "[OK] Interfaz de red 'tun0' creada exitosamente."
        
        # Check 2: Can we actually route traffic through it? (5 seconds timeout)
        NEW_IP=$(curl -s --max-time 5 ifconfig.me || echo "FAILED")
        
        if [ "$NEW_IP" != "FAILED" ]; then
            echo "[SUCCESS] ✅ Conexión establecida. IP Pública: $NEW_IP"
            SUCCESS=1
            break
        else
            echo "[WARNING] ⚠️ Interfaz creada pero no hay salida a Internet (Timeout). Reintentando con otro servidor..."
        fi
    else
        echo "[WARNING] ⚠️ La interfaz 'tun0' no se levantó. El servidor podría estar caído o rechazó las credenciales. Reintentando..."
    fi
done

if [ $SUCCESS -eq 0 ]; then
    echo "[FATAL] 🛑 Se agotaron todos los servidores VPN disponibles. Fallo total de conexión."
    exit 1
fi