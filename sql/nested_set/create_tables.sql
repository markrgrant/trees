-- nested set representation
CREATE TABLE IF NOT EXISTS container_ns (
    id SERIAL PRIMARY KEY
    , name TEXT NOT NULL UNIQUE
    , lft INTEGER NOT NULL UNIQUE
    , rgt INTEGER NOT NULL UNIQUE
    , CHECK (lft < rgt)
);
