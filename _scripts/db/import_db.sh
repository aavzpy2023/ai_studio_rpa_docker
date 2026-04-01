#!/bin/bash

# --- DATABASE RESTORE PROTOCOL (psql) ---
# This script injects the 'in_use_backup.sql' directly into the running
# Docker container. It replaces the legacy 'pg_restore' binary method.

# 1. Load environment variables
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
else
    echo "[ERROR] .env file not found. Run from root."
    exit 1
fi

# 2. Configuration
BACKUP_FILE="./_scripts/db/in_use_backup.sql"
CONTAINER_NAME="ai_assist_postgres"

# 3. Validation
if [ ! -f "$BACKUP_FILE" ]; then
    echo "[CRITICAL] Backup file not found: $BACKUP_FILE"
    echo "Please place your SQL dump there or run 'make db-export' and rename the result."
    exit 1
fi

echo "[WARN] ⚠️  This will OVERWRITE the database '$POSTGRES_DB' in container '$CONTAINER_NAME'."
echo "[INFO] Reading from: $BACKUP_FILE"
# Optional: Add a pause or confirmation here if you want extra safety
# read -p "Press [Enter] to continue..."

# 4. Execution (Pipe Host File -> Docker Container -> PSQL)
# We use -q (quiet) to reduce noise, but you can remove it to see all SQL commands.
docker exec -i "$CONTAINER_NAME" psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" < "$BACKUP_FILE"

# 5. Result Analysis
if [ $? -eq 0 ]; then
    echo "[SUCCESS] Database restored successfully from SQL."
else
    echo "[ERROR] Restoration failed. Check the SQL syntax or container status."
    exit 1
fi
