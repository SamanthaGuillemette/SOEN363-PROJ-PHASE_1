-- (f)

-- i. Top 10 movies with the highest number of ratings sorted in descending number of ratings.
DROP VIEW IF EXISTS top_num_ratings_movies;
CREATE VIEW top_num_ratings_movies
AS
SELECT *
FROM movies
where num_rating is not null
  and rating is not null
ORDER BY num_rating DESC
LIMIT 10;

SELECT *
FROM top_num_ratings_movies;

-- View creation time: 1ms
-- First execution time: 27ms
-- Subsequent execution time: 25ms