-- adjacency list representation
CREATE TABLE IF NOT EXISTS container_al (
    id SERIAL PRIMARY KEY
    , name TEXT NOT NULL UNIQUE
    , position TEXT NOT NULL
    , parent_id INT REFERENCES container_al(id) NOT NULL
    , UNIQUE (name, parent_id)
    , UNIQUE (position, parent_id)
);
