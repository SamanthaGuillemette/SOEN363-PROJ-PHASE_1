-- (a)
-- Print all movies with actor Daniel Craig and sort by ascending movie title.
-- No need to specify asc in the order by because it is using asc by default.

SELECT title
FROM movies
         join actors on movies.mid = actors.mid and actors.name = 'Daniel Craig'
ORDER BY title

