#!/usr/bin/env bash

# create the database that will be used for comparing performance
createdb test_db
# psql -U postgres -d test_db -c "CREATE EXTENSION pgcrypto;"
