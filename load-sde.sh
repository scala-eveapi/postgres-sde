#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER yaml;
EOSQL

pg_restore -d "${POSTGRES_DB:-$POSTGRES_USER}" -U "$POSTGRES_USER" sde

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    REASSIGN OWNED BY yaml TO $POSTGRES_USER;
    DROP OWNED BY yaml;
EOSQL
