-- (j)

-- 3. Third, create a view called 'non_existent' from the view 'all_combinations'
-- by removing all legitimate (co_actor, mid) pairs (i.e., pairs that exist in
-- the actors table). Print the number of rows in this view.

DROP VIEW IF EXISTS existent;
DROP VIEW IF EXISTS non_existent;

CREATE VIEW existent
AS
SELECT DISTINCT actors.name, actors.mid
FROM actors
         JOIN (
    SELECT mid
    FROM actors
    WHERE name = 'Annette Nicole'
) AS movies ON actors.mid = movies.mid;

CREATE VIEW non_existent
AS
SELECT name, mid
FROM all_combinations
WHERE all_combinations.mid NOT IN (
    SELECT mid
    FROM existent
    WHERE all_combinations.name = existent.name
);

SELECT count(*)
from non_existent;

-- There are 239 number of rows in the non_existent view
-- View 'existent' creation time: 3ms
-- View 'non_existent' creation time: 4ms