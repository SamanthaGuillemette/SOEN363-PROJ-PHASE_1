-- (f)

-- iii. Print movies that are in the top highest number of ratings list and that are in the top highest ratings list.
-- Will not return any movies because the highest rated movies are not in the most rated movies.
SELECT *
FROM top_num_ratings_movies
         join top_ratings_movies trm on top_num_ratings_movies.mid = trm.mid;

-- First execution time: 45ms
-- Subsequent execution time: 20ms

-- Has no output csv because the query does not return anything