-- (a)
-- Print all movies with actor Daniel Craig and sort by ascending movie title.
-- No need to specify asc in the order by because it is using asc by default.

SELECT title
FROM movies
         join actors on movies.mid = actors.mid and actors.name = 'Daniel Craig'
ORDER BY title

/*
Execution time: 35ms

+----------------------------+
|title                       |
+----------------------------+
|A Kid in King Arthur's Court|
|Archangel                   |
|Casino Royale               |
|Casino Royale               |
|Elizabeth                   |
|Enduring Love               |
|Infamous                    |
|Lara Croft: Tomb Raider     |
|Layer Cake                  |
|Munich                      |
|Quantum of Solace           |
|Renaissance                 |
|Road to Perdition           |
|Sorstalanság                |
|Sylvia                      |
|The Golden Compass          |
|The Invasion                |
|The Jacket                  |
|The Mother                  |
|The Mother                  |
|The Power of One            |
+----------------------------+
*/

