# Nombre del archivo: list_tables.sh
#!/bin/bash

# --- CONFIGURACIÓN ---
CONTAINER_NAME="ai_assist_postgres"
DB_NAME="DFGChatAI"

# 1. Validación de contenedor
if ! docker ps --format '{{.Names}}' | grep -q "${CONTAINER_NAME}"; then
    echo "[ERROR] El contenedor '${CONTAINER_NAME}' no está corriendo."
    echo "Asegúrate de ejecutar 'docker compose up -d' primero."
    exit 1
fi

echo "[INFO] Conectando a '${DB_NAME}' en el contenedor '${CONTAINER_NAME}'..."

# 2. Ejecución del comando psql
# -t : No mostrar encabezados de columnas
# -c : Ejecutar el comando psql. \dt lista las tablas, -q lo hace sin ruido.
docker exec "${CONTAINER_NAME}" psql -U postgres -d "${DB_NAME}" -t -c '\dt'

if [ $? -eq 0 ]; then
    echo "[OK] Listado de tablas completado."
else
    echo "[ERROR] Falló la ejecución de psql."
    exit 1
fi
