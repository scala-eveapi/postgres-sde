#!/bin/bash
set -e

pg_restore -d "${POSTGRES_DB:-$POSTGRES_USER}" -U "$POSTGRES_USER" sde
