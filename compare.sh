#!/usr/bin/env bash


echo "NESTED SET PERFORMANCE"
echo "----------------------"
echo "Finding Root Container"
psql -d test_db -c "explain analyze select * from root_container_ns()"
echo "Finding All Leaf Containers"
psql -d test_db -c "explain analyze select * from leaf_containers_ns()"
echo "Finding All Descendant Containers"
psql -d test_db -c "explain analyze select * from descendant_containers_ns(1)"
echo "Finding 1/4 of Descendant Containers"
psql -d test_db -c "explain analyze select * from descendant_containers_ns(2)"
ecoh "Finding 1/8 of Descendant Containers"
psql -d test_db -c "explain analyze select * from descendant_containers_ns(3)"



echo "ADJACENCY LIST PERFORMANCE"
echo "----------------------"
echo "Finding Root Container"
psql -d test_db -c "explain analyze select * from root_container_al()"
echo "Finding All Leaf Containers"
psql -d test_db -c "explain analyze select * from leaf_containers_al()"
echo "Finding All Descendant Containers"
psql -d test_db -c "explain analyze select * from descendant_containers_al(1)"
echo "Finding 1/4 of Descendant Containers"
psql -d test_db -c "explain analyze select * from descendant_containers_al(2)"
ecoh "Finding 1/8 of Descendant Containers"
psql -d test_db -c "explain analyze select * from descendant_containers_al(3)"
