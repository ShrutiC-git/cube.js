#!/bin/bash

set -e # exit immediately if a command exits with a non-zero status.

POSTGRES="psql -U postgres"

# create database for superset
echo "Seeding database: metabase"
$POSTGRES <<EOSQL
USE postgres
CREATE TABLE users (
  user_id int PRIMARY KEY,
  username varchar(25) NOT NULL,
  country varchar(30) NOT NULL
);
INSERT into users VALUES (1, "NN", "IN"), (2, "BN", "NZ"), (3, "SS", "AU"), (4, "G", "RUS");
SELECT * FROM users;
EOSQL
