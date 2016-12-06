#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER yaml;
    GRANT ALL ON ALL TABLES IN SCHEMA public TO yaml;
EOSQL

echo "starting restore"

pg_restore -d "${POSTGRES_DB:-$POSTGRES_USER}" -U "$POSTGRES_USER" postgres-latest.dmp

echo "restore done"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    REASSIGN OWNED BY yaml TO $POSTGRES_USER;
    DROP OWNED BY yaml;
EOSQL
