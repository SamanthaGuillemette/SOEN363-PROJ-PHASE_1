-- (j)

-- 4. Finally, from the view 'co_actors', eliminate the distinct actors that appear in
-- the view 'non_existent'. Print the names of all 'co_actors' except
-- Annette Nicole.

DROP VIEW IF EXISTS friends;

CREATE VIEW friends
AS
SELECT co_actors.name
FROM co_actors
WHERE co_actors.name <> 'Annette Nicole'
  and co_actors.name NOT IN (SELECT name FROM non_existent);

SELECT *
from friends;

-- View creation time: 1ms
-- First execution time: 853ms
-- Subsequent execution time: 839ms