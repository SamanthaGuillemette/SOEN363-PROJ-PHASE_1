-- (f)

-- ii. Top 10 movies with the highest ratings sorted in ascending order of movie id.
DROP VIEW IF EXISTS top_ratings_movies;
CREATE VIEW top_ratings_movies
AS
SELECT *
FROM (SELECT *
      FROM movies
      where num_rating is not null
        and rating is not null
      ORDER BY rating DESC
      LIMIT 10) as m
ORDER BY mid;

SELECT *
FROM top_ratings_movies;

-- View creation time: 2ms
-- First execution time: 26ms
-- Subsequent execution time: 26ms