CONTAINER_NAME="ai_assist_postgres"
DB_NAME="DFGChatAI"

# 1. Validación de Seguridad
if ! docker ps --format '{{.Names}}' | grep -q "${CONTAINER_NAME}"; then
    echo "[ERROR] El contenedor '${CONTAINER_NAME}' no está activo."
    exit 1
fi

echo "[INFO] 🛠️  Aplicando parche a 'bff_vendor'..."

# 2. Ejecución DDL Atómica
docker exec "${CONTAINER_NAME}" psql -U postgres -d "${DB_NAME}" -c "
    ALTER TABLE public.bff_vendor
    ADD COLUMN IF NOT EXISTS is_internal BOOLEAN DEFAULT FALSE NOT NULL;
"

# 3. Verificación
if [ $? -eq 0 ]; then
    echo "[SUCCESS] ✅ Columna 'is_internal' agregada correctamente."
else
    echo "[CRITICAL] ❌ Falló la migración."
    exit 1
fi