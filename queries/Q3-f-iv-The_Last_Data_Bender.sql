-- (f)

-- iv. 10 movies with the lowest ratings sorted by ascending order of movie id, but that have been rated at least once
DROP VIEW IF EXISTS low_ratings_movies;
CREATE VIEW low_ratings_movies
AS
SELECT *
FROM (SELECT *
      FROM movies
      where num_rating > 0
      ORDER BY rating
      LIMIT 10) as m
ORDER BY mid;

SELECT *
FROM low_ratings_movies;

-- View creation time: 2ms
-- First execution time: 25ms
-- Subsequent execution time: 20ms