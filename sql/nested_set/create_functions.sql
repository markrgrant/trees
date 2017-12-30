-- a helper function for finding the root node in a nested set hierarchy
CREATE OR REPLACE FUNCTION root_container_ns()
    RETURNS TABLE(id int, name text, lft int, rgt int) AS $$
    BEGIN
        RETURN QUERY
        SELECT c.id, c.name, c.lft, c.rgt
        FROM container_ns c
        WHERE c.lft = 0;
    END
$$ LANGUAGE plpgsql;


-- a helper function for finding the leaf nodes in a nested set hierarchy
CREATE OR REPLACE FUNCTION leaf_containers_ns()
    RETURNS TABLE(id int, name text, lft int, rgt int) AS $$
    BEGIN
        RETURN QUERY
        SELECT c.id, c.name, c.lft, c.rgt
        FROM container_ns c
        WHERE c.rgt - c.lft = 1;
    END
$$ LANGUAGE plpgsql;



-- a helper function for populating nested set containers
CREATE OR REPLACE FUNCTION create_container_ns(
    lft INTEGER,
    rgt INTEGER,
    children_per_node INTEGER
) RETURNS INTEGER AS $$
    BEGIN
        IF lft + 1 > rgt THEN
            RETURN 0;
        ELSE
            DECLARE
                child_lft INTEGER;
                child_rgt INTEGER;
                nums_per_child INTEGER;
                cur_lft INTEGER;
                cur_rgt INTEGER;
                parent_id_val INTEGER;
            BEGIN
                INSERT INTO
                    -- create this container
                    container_ns(name, lft, rgt)
                VALUES
                    (gen_random_uuid()::text, lft, rgt)
                RETURNING
                    id
                INTO parent_id_val;
                child_lft = lft + 1;
                child_rgt = rgt - 1;
                nums_per_child = (child_rgt - child_lft + 1)/children_per_node;
                cur_lft = child_lft;
                cur_rgt = child_lft + nums_per_child - 1;
                FOR i in 1..children_per_node LOOP
                    -- create child containers
                    PERFORM create_container_ns(
                        cur_lft,
                        cur_rgt,
                        children_per_node);
                    cur_lft = cur_rgt + 1;
                    cur_rgt = cur_lft + nums_per_child - 1;
                END LOOP;      
            END;
            RETURN 0;
        END IF;
    END
$$ LANGUAGE plpgsql;
