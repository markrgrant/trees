-- left = 0
-- children_per_node = 4
-- depth = 9
-- num_nodes = 4**0 + 4**1 + 4**2 + ... + 4**9 = 1398100
-- right = 2 * num_nodes - 1 = 2796199
select * from create_container_ns(0, 2796199, 4);
