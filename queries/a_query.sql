SELECT Movies.title
FROM Movies
         join Actors on Movies.mid = Actors.mid and Actors.name = 'Daniel Craig'
ORDER BY Movies.title asc