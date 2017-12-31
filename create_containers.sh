#!/usr/bin/env bash
psql -d test_db -f sql/adjacency_list/create_containers.sql
# psql -d test_db -f sql/nested_set/create_containers.sql
