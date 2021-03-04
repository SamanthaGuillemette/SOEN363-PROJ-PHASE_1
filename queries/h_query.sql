-- (h) i.
-- Create a view called 'high ratings' which contains the distinct names of
-- all actors who have played in movies with a rating greater than or equal
-- to 4. Similarly, create a view called 'low ratings' which contains the
-- distinct names of all actors who have played in movies with a rating less
-- than 4.

DROP VIEW IF EXISTS high_ratings CASCADE ;
DROP VIEW IF EXISTS low_ratings;

CREATE VIEW high_ratings
AS
SELECT DISTINCT A.name
FROM actors AS A, movies AS M
WHERE
  A.mid = M.mid
  AND M.rating >= 4;

SELECT COUNT(*) AS high_ratings_counts FROM high_ratings;

CREATE VIEW low_ratings
AS
SELECT DISTINCT A.name
FROM actors AS A, movies AS M
WHERE
  A.mid = M.mid
  AND M.rating < 4;

SELECT COUNT(*) AS low_ratings_counts FROM low_ratings;

-- (h) ii.
-- Use the above views to print the number of 'no flop' actors in the database.

DROP VIEW IF EXISTS no_flop;

CREATE VIEW no_flop
AS
SELECT name
FROM high_ratings
WHERE name NOT IN (SELECT name FROM low_ratings);

SELECT COUNT(*) AS no_flop_count FROM no_flop;

-- (h) iii.
-- For each 'no flop' actor, print the name of the actor and the number of
-- movies N that he/she played in, sorted in descending order of N.
-- Finally, print the top 10 only.

SELECT name, COUNT(*) AS N
FROM actors
WHERE name IN (SELECT name FROM no_flop)
GROUP BY name
ORDER BY COUNT(*) DESC
LIMIT 10
