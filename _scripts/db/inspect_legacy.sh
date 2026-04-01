#!/bin/bash
CONTAINER="ai_assist_postgres"
DB="DFGChatAI"

echo "--- ESQUEMA: bff_vendor (Distribuidores) ---"
docker exec $CONTAINER psql -U postgres -d $DB -c "\d bff_vendor"

echo -e "\n--- ESQUEMA: bff_customers (Clientes) ---"
docker exec $CONTAINER psql -U postgres -d $DB -c "\d bff_customers"

echo -e "\n--- ESQUEMA: bff_category (Posible Clasificador) ---"
docker exec $CONTAINER psql -U postgres -d $DB -c "\d bff_category"