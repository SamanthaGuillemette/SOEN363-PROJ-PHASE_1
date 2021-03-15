--4b.1)
-- Profile the query execution time with and without the indexes.

--Profile querying actors with indexes
EXPLAIN ANALYZE SELECT * FROM mw_actors;

-- First execution time: 66ms
-- Subsequent execution time: 55ms

--Profile querying actors without indexes
EXPLAIN ANALYZE SELECT * FROM actors;

-- First execution time: 183s
-- Subsequent execution time: 141ms

--Profile querying genres with indexes
EXPLAIN ANALYZE SELECT * FROM mw_genres;

-- First execution time: 155ms
-- Subsequent execution time: 135ms

--Profile querying genres without indexes
EXPLAIN ANALYZE SELECT * FROM genres;

-- First execution time: 144ms
-- Subsequent execution time: 174ms

--Profile querying movies with indexes
EXPLAIN ANALYZE SELECT * FROM mw_movies;

-- First execution time: 134ms
-- Subsequent execution time: 128ms

--Profile querying movies without indexes
EXPLAIN ANALYZE SELECT * FROM movies;

-- First execution time: 181ms
-- Subsequent execution time: 143ms

--Profile querying tag_names with indexes
EXPLAIN ANALYZE SELECT * FROM mw_tag_names;

-- First execution time: 201ms
-- Subsequent execution time: 148ms

--Profile querying tag_names without indexes
EXPLAIN ANALYZE SELECT * FROM tag_names;

-- First execution time: 153ms
-- Subsequent execution time: 146ms

--Profile querying tags with indexes
EXPLAIN ANALYZE SELECT * FROM mw_tags;

-- First execution time: 203ms
-- Subsequent execution time: 184ms

--Profile querying tags without indexes
EXPLAIN ANALYZE SELECT * FROM tags;

-- First execution time: 166ms
-- Subsequent execution time: 208ms