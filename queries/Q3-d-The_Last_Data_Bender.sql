-- (d)
-- Print the movie title, year and rating for each year by ascending order of year and descending order of rating in case of same-year movies.

SELECT title, year, rating
FROM movies
ORDER BY year, rating desc

-- First execution time: 178ms
-- Subsequent execution time: 22ms