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

-- iii. Print movies that are in the top highest number of ratings list and that are in the top highest ratings list.
-- Will not return any movies because the highest rated movies are not in the most rated movies.
SELECT *
FROM top_num_ratings_movies
         join top_ratings_movies trm on top_num_ratings_movies.mid = trm.mid;

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

-- v. Print movies that are in the top 10 highest number of ratings and that are in the top 10 lowest ratings.
-- Will not return any movies because the lowest rated movies are not in the most rated movies.
SELECT *
FROM top_num_ratings_movies
         join low_ratings_movies lrm on top_num_ratings_movies.mid = lrm.mid

-- vi. In conclusion, both our conjectures were wrong.
-- The movies with the highest number of ratings are not the movies with the highest ratings.
-- And the movies with the highest number of ratings are not in the movies with the lowest ratings.
