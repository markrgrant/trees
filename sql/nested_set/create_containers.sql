-- height = 10  root node is at height 1
-- left = 1
-- children_per_node = 4
-- num_nodes = (children_per_node**height - 1) / (children_per_node - 1)
--           = 349525 
-- right = 2 * num_nodes
--       = 699050
select * from create_container_ns(1, 699050, 4);
