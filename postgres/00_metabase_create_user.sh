#!/bin/bash

set -e # exit if a command exits with a not-zero exit code

POSTGRES="psql -U postgres"

# create a shared role to read & write general datasets into postgres
echo "Creating database role: postgres"
$POSTGRES <<-EOSQL
CREATE USER postgres WITH
    LOGIN
    NOSUPERUSER
    NOCREATEDB
    NOCREATEROLE
    NOINHERIT
    NOREPLICATION
    PASSWORD '$METABASE_PASSWORD';
EOSQL
