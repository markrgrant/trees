-- nested set representation
-- note that a position column is not needed, it can be inferred
-- from left value ordering
CREATE TABLE container_ns (
    id SERIAL PRIMARY KEY
    , name TEXT NOT NULL
    , "left" INT NOT NULL
    , "right" INT NOT NULL
);
