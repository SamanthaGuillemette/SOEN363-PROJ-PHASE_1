-- (h)

-- i. Create a view called 'high ratings' which contains the distinct names of
-- all actors who have played in movies with a rating greater than or equal
-- to 4. Similarly, create a view called 'low ratings' which contains the
-- distinct names of all actors who have played in movies with a rating less
-- than 4.

DROP VIEW IF EXISTS high_ratings CASCADE;
DROP VIEW IF EXISTS low_ratings;

CREATE VIEW high_ratings
AS
SELECT DISTINCT A.name
FROM actors AS A,
     movies AS M
WHERE A.mid = M.mid
  AND M.rating >= 4;

SELECT COUNT(*) AS high_ratings_counts
FROM high_ratings;

-- There are 13710 number of rows in the high_ratings view
-- View creation time: 1ms

CREATE VIEW low_ratings
AS
SELECT DISTINCT A.name
FROM actors AS A,
     movies AS M
WHERE A.mid = M.mid
  AND M.rating < 4;

SELECT COUNT(*) AS low_ratings_counts
FROM low_ratings;

-- There are 87032 number of rows in the low_ratings view
-- View creation time: 3ms
