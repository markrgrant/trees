-- adjacency list representation
CREATE TABLE IF NOT EXISTS container_al (
    id SERIAL PRIMARY KEY
    , name TEXT NOT NULL UNIQUE
    , parent_id INT REFERENCES container_al(id) NOT NULL
    , UNIQUE (name, parent_id)
);
