CREATE OR REPLACE FUNCTION create_container_ns(
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
