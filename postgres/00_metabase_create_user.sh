#!/bin/bash

set -e # exit if a command exits with a not-zero exit code

POSTGRES="sudo -u postgres createuser postgres"

# create a shared role to read & write general datasets into postgres
echo "Creating database role: metabase"
$POSTGRES <<-EOSQL
CREATE USER metabase WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    PASSWORD '$METABASE_PASSWORD';
EOSQL
