-- (j)

-- 1. First, create a view called 'co_actors', which returns the distinct names of
-- actors who played in at least one movie with Annette Nicole. Print the number
-- of rows in this view.

DROP VIEW IF EXISTS co_actors CASCADE;

CREATE VIEW co_actors
AS
SELECT DISTINCT actors.name
FROM actors
         JOIN (
    SELECT mid
    FROM actors
    WHERE name = 'Annette Nicole'
) AS movies ON actors.mid = movies.mid;

SELECT count(*)
from co_actors;

-- There are 179 number of rows in the co_actors view
-- View creation time: 2ms