-- (j)

-- 2. Second, create a view called 'all_combinations' which returns all possible
-- combinations of 'co_actors' and the movie ids in which Annette Nicole played.
-- Print the number of rows in this view. Note how that this view contains fake
-- (co_actor, mid) combinations!

DROP VIEW IF EXISTS all_combinations CASCADE;

CREATE VIEW all_combinations
AS
SELECT DISTINCT name, mid
FROM co_actors,
     (SELECT mid FROM actors WHERE name = 'Annette Nicole') AS movies;

SELECT count(*)
from all_combinations;

-- There are 537 number of rows in the all_combinations view
-- View creation time: 3ms