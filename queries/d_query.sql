-- (d)
-- Print the movie title, year and rating for each year by ascending order of year and descending order of rating in case of same-year movies.

SELECT title, year, rating
FROM movies
ORDER BY year, rating desc

/*
Execution time: 25ms

Output has been reduced to the 10 first entries instead of the 10 197 entries in the database (to save space)

+--------------------------------------------------------------------------------------------------------+----+------+
|title                                                                                                   |year|rating|
+--------------------------------------------------------------------------------------------------------+----+------+
|The Great Train Robbery                                                                                 |1903|0     |
|The Birth of a Nation                                                                                   |1915|3.3   |
|Intolerance: Love's Struggle Throughout the Ages                                                        |1916|3.8   |
|Otets Sergiy                                                                                            |1917|0     |
|The Immigrant                                                                                           |1917|0     |
|A Dog's Life                                                                                            |1918|0     |
|Broken Blossoms or The Yellow Man and the Girl                                                          |1919|3.7   |
|Die Spinnen, 1. Teil - Der Goldene See                                                                  |1919|0     |
|Male and Female                                                                                         |1919|0     |
|Das Cabinet des Dr. Caligari.                                                                           |1920|4.1   |
+--------------------------------------------------------------------------------------------------------+----+------+
*/