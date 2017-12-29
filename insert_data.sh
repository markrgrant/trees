#!/usr/bin/env bash

psql -d test_db -f sql/adjacency_list/insert_root_node.sql
psql -d test_db -f sql/adjacency_list/insert_containers.sql
psql -d test_db -f sql/nested_set/insert_data.sql
