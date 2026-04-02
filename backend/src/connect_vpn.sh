#!/bin/bash
# Script to connect to OpenVPN (ProtonVPN) inside the Docker container

if [ -z "$1" ]; then
    echo "[ERROR] Uso: ./src/connect_vpn.sh src/<tu_archivo.ovpn>"
    exit 1
fi

OVPN_FILE=$1

if [ ! -f "$OVPN_FILE" ]; then
    echo "[ERROR] El archivo '$OVPN_FILE' no existe."
    exit 1
fi

echo "[INFO] Conectando a VPN usando $OVPN_FILE..."
# El usuario appuser tiene NOPASSWD para sudo (configurado en el Dockerfile)
sudo openvpn --config "$OVPN_FILE" --daemon

echo "[INFO] Esperando 5 segundos para establecer conexión..."
sleep 5

echo "[INFO] Nueva IP pública:"
curl -s ifconfig.me
echo ""