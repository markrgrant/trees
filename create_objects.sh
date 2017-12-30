#!/usr/bin/env bash

psql -d test_db -f sql/adjacency_list/create_tables.sql
psql -d test_db -f sql/adjacency_list/create_functions.sql
# psql -d test_db -f sql/adjacency_list/create_extensions.sql
psql -d test_db -f sql/nested_set/create_tables.sql
psql -d test_db -f sql/nested_set/create_functions.sql
