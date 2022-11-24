#!/bin/bash

set -e # exit immediately if a command exits with a non-zero status.

POSTGRES="psql --username postgres"

# create database for superset
echo "Creating table and data: metabase"
$POSTGRES <<EOSQL
CREATE TABLE metabase.public.users (lastName varchar(30), firstName varchar(30), age int);
INSERT INTO public.users (lastName, firstName, age) values ("c","s",1), ("a","q",2), ("d","z",6),("f","t",6),("c","q",4),("k","s",1);
EOSQL
