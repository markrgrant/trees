-- create a dummy root node
INSERT INTO
    container_al (id, name, position, parent_id)
VALUES
    (0, '<dummy node>', '<dummy position>', 0);

-- create the remaining nodes
select * from create_container_al(0, 'a', 4, 0, 10);
