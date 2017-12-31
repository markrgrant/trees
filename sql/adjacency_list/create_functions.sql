-- a helper function for finding the root container
CREATE OR REPLACE FUNCTION root_container_al()
    RETURNS TABLE(id int, name text, "position" text, parent_id int) AS $$
    BEGIN
        RETURN QUERY
        SELECT c.id, c.name, c.position, c.parent_id
        FROM container_al c
        WHERE c.parent_id = 0 and c.parent_id <> c.id;
    END
$$ LANGUAGE plpgsql;


-- a helper function for finding the leaf containers
CREATE OR REPLACE FUNCTION leaf_containers_al()
    RETURNS TABLE(id int, name text, "position" text, parent_id int) AS $$
    BEGIN
        RETURN QUERY
        SELECT c.id, c.name, c.position, c.parent_id
        FROM container_al c
        WHERE not exists (
            select 1 from container_al cc
            where cc.parent_id = c.id);
    END
$$ LANGUAGE plpgsql;


-- a helper function for finding descendant containers
CREATE OR REPLACE FUNCTION descendant_containers_al(_id int)
    RETURNS TABLE(id int, name text, "position" text, parent_id int) AS $$
    BEGIN
        RETURN QUERY
        WITH RECURSIVE descendant_containers(id, name, position, parent_id) AS (
              SELECT p.id, p.name, p.position, p.parent_id
              FROM container_al p where p.parent_id = _id
            UNION ALL
              SELECT c.id, c.name, c.position, c.parent_id
              FROM descendant_containers d, container_al c
              WHERE c.parent_id = d.id
        )
        SELECT *
        FROM descendant_containers;
    END
$$ LANGUAGE plpgsql;


-- a helper function for finding the height of a subtree
-- TODO

-- a helper method for populating adjacency list containers
CREATE OR REPLACE FUNCTION create_container_al(
    parent_id INTEGER,
    pos TEXT,
    num_children INTEGER,
    cur_depth INTEGER,
    max_depth INTEGER
) RETURNS INTEGER AS $$
    DECLARE
        -- declarations e.g.
        -- quantity integer := 30;
        -- quantity integer DEFAULT 30;
    BEGIN
        -- statements
        IF cur_depth = max_depth THEN
            RETURN 0;
        ELSE
            DECLARE
                parent_id_val INTEGER;
            BEGIN
                INSERT INTO
                    container_al(name, position, parent_id)
                VALUES
                    (gen_random_uuid()::text, pos, parent_id)
                RETURNING
                    id
                INTO parent_id_val;
                FOR i in 1..num_children LOOP
                    PERFORM create_container_al(
                        parent_id_val,
                        i::TEXT,
                        num_children,
                        cur_depth+1,
                        max_depth);
                END LOOP;      
            END;
            RETURN 0;
        END IF;
    END
$$ LANGUAGE plpgsql;
