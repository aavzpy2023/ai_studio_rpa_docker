#!/bin/bash
# PROTOCOLO DE EXPORTACIÓN MAESTRA v5.4 (QA LEAD EDITION)

# 1. Cargar variables de entorno
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "[ERROR] .env file not found."
    exit 1
fi

# 2. Configuración de nombres
EXPORT_DIR="./_scripts/db"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
# Archivo versionado (para historial)
VERSIONED_FILE="${EXPORT_DIR}/backup_${POSTGRES_DB}_${TIMESTAMP}.sql"
# Archivo de inicio (para Docker init)
INIT_FILE="${EXPORT_DIR}/in_use_backup.sql"
CONTAINER_NAME="ai_assist_postgres"

# 3. FIX: Corregir error "Is a directory" (Docker Artifact)
if [ -d "$INIT_FILE" ]; then
    echo "[WARN] ⚠️ Detectado '$INIT_FILE' como directorio. Eliminando para corregir..."
    rm -rf "$INIT_FILE"
fi

echo "[INFO] 🚀 Iniciando exportación total desde: ${CONTAINER_NAME}..."

# 4. Ejecutar pg_dump
docker exec -e PGPASSWORD="${POSTGRES_PASSWORD}" "${CONTAINER_NAME}" \
    pg_dump -U "${POSTGRES_USER}" -d "${POSTGRES_DB}" \
    --clean --if-exists \
    --no-owner \
    --no-privileges \
    > "$VERSIONED_FILE"

# 5. Validación y Actualización de Semilla
if [ $? -eq 0 ]; then
    # Copiamos el backup actual al archivo que Docker usa como semilla (init.sql)
    cp "$VERSIONED_FILE" "$INIT_FILE"

    TABLE_COUNT=$(grep -c "CREATE TABLE" "$VERSIONED_FILE")
    echo "[OK] ✅ Backup versionado: $VERSIONED_FILE"
    echo "[OK] 🔄 Semilla actualizada: $INIT_FILE"
    echo "[INFO] 📊 Tablas detectadas: $TABLE_COUNT"
else
    echo "[ERROR] ❌ La exportación falló."
    exit 1
fi