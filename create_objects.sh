#!/usr/bin/env bash

psql -d test_db -f sql/adjacency_list/create_tables.sql
psql -d test_db -f sql/adjacency_list/create_container_function.sql
# psql -d test_db -f sql/adjacency_list/create_extensions.sql
psql -d test_db -f sql/nested_set/create_tables.sql
