#!/bin/bash
# AUTOR: SSS Kernel
# CONTEXTO: Reparación de Esquema para Knowledge Smart Sync
# DESCRIPCIÓN: Inyecta columnas faltantes en ai_knowledge_store sin downtime.

CONTAINER_NAME="ai_assist_postgres"
DB_NAME="DFGChatAI"

# Verificación de seguridad
if ! docker ps --format '{{.Names}}' | grep -q "${CONTAINER_NAME}"; then
    echo "[ERROR] El contenedor '${CONTAINER_NAME}' no está activo."
    exit 1
fi

echo "[INFO] 🛠️  Iniciando parche de esquema en '${DB_NAME}'..."

# Ejecución de DDL Atómico (Idempotente gracias a IF NOT EXISTS)
docker exec "${CONTAINER_NAME}" psql -U postgres -d "${DB_NAME}" -c "
    BEGIN;

    -- 1. Inyección de Columnas de Sincronización
    ALTER TABLE public.ai_knowledge_store
    ADD COLUMN IF NOT EXISTS content_hash VARCHAR(64),
    ADD COLUMN IF NOT EXISTS metadata JSONB DEFAULT '{}'::jsonb,
    ADD COLUMN IF NOT EXISTS last_synced_at TIMESTAMP,
    ADD COLUMN IF NOT EXISTS prev_chunk_id INTEGER,
    ADD COLUMN IF NOT EXISTS next_chunk_id INTEGER;

    -- 2. Optimización de Búsqueda (Hash Index)
    CREATE INDEX IF NOT EXISTS ix_ai_knowledge_store_content_hash
    ON public.ai_knowledge_store (content_hash);

    COMMIT;
"

if [ $? -eq 0 ]; then
    echo "[SUCCESS] ✅ Esquema sincronizado correctamente. Reinicia el backend si es necesario."
else
    echo "[CRITICAL] ❌ Falló la actualización del esquema."
    exit 1
fi
