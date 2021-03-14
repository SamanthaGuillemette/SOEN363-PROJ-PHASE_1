-- (b)
-- Print all actors from the movie The Dark Knight and sort by ascending actor name.
-- No need to specify asc in the order by because it is using asc by default.

SELECT name
FROM actors
         join movies on actors.mid = movies.mid and movies.title = 'The Dark Knight'
ORDER BY name

-- First execution time: 50ms
-- Subsequent execution time: 22ms