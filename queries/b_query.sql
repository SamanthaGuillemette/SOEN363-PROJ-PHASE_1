SELECT Actors.name
FROM Actors
         join Movies on Actors.mid = Movies.mid and Movies.title = 'The Dark Knight'
ORDER BY Actors.name asc