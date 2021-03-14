-- (c)
-- Print all distinct genres used to describe more than 1000 movies and sort by ascending number of movies.
-- No need to specify asc in the order by because it is using asc by default.

SELECT genre, COUNT(*) as number_of_movies
FROM genres
         join movies on genres.mid = movies.mid
GROUP BY genre
HAVING COUNT(*) > 1000
ORDER BY number_of_movies

/*
Execution time: 24ms

+---------+----------------+
|genre    |number_of_movies|
+---------+----------------+
|Adventure|1003            |
|Crime    |1086            |
|Action   |1445            |
|Romance  |1644            |
|Thriller |1664            |
|Comedy   |3566            |
|Drama    |5076            |
+---------+----------------+
*/
