-- (f)

-- v. Print movies that are in the top 10 highest number of ratings and that are in the top 10 lowest ratings.
-- Will not return any movies because the lowest rated movies are not in the most rated movies.
SELECT *
FROM top_num_ratings_movies
         join low_ratings_movies lrm on top_num_ratings_movies.mid = lrm.mid

-- First execution time: 42ms
-- Subsequent execution time: 25ms

-- Has no output csv because the query does not return anything