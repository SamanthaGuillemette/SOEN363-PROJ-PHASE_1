-- (4a)

-- Create Materialized View for actors
CREATE MATERIALIZED VIEW IF NOT EXISTS mw_actors AS SELECT * FROM actors;
CREATE UNIQUE INDEX act_ind ON mw_actors(mid, name);

-- Materialized View creation time: 434ms
-- Index creation time: 451ms

-- Create Materialized View for genres
CREATE MATERIALIZED VIEW IF NOT EXISTS mw_genres AS SELECT * FROM genres;
CREATE UNIQUE INDEX gen_ind ON mw_genres(mid, genre);

-- Materialized View creation time: 19ms
-- Index creation time: 20ms

-- Create Materialized View for movies
CREATE MATERIALIZED VIEW IF NOT EXISTS mw_movies AS SELECT * FROM movies;
CREATE UNIQUE INDEX mov_ind ON mw_movies(mid);

-- Materialized View creation time: 15ms
-- Index creation time: 9ms

-- Create Materialized View for movies
CREATE MATERIALIZED VIEW IF NOT EXISTS mw_tag_names AS SELECT * FROM tag_names;
CREATE UNIQUE INDEX tagn_ind ON mw_tag_names(tid);

-- Materialized View creation time: 15ms
-- Index creation time: 12ms

-- Create Materialized View for movies
CREATE MATERIALIZED VIEW IF NOT EXISTS mw_tags AS SELECT * FROM tags;
CREATE UNIQUE INDEX tags_ind ON mw_tags(mid, tid);

-- Materialized View creation time: 38ms
-- Index creation time: 28ms


-- First execution time: 1s 75 ms
-- Subsequent execution time: 1s 80 ms