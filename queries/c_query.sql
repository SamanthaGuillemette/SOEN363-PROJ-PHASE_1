SELECT Genres.genre, COUNT(*) as number_of_movies
FROM Genres
         join Movies on Genres.mid = Movies.mid
GROUP BY Genres.genre
HAVING COUNT(*) > 1000
ORDER BY number_of_movies