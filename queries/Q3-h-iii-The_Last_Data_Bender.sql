-- (h)

-- iii. For each 'no flop' actor, print the name of the actor and the number of
-- movies N that he/she played in, sorted in descending order of N.
-- Finally, print the top 10 only.

SELECT name, COUNT(*) AS N
FROM actors
WHERE name IN (SELECT name FROM no_flop)
GROUP BY name
ORDER BY COUNT(*) DESC
LIMIT 10

-- First execution time: 159ms
-- Subsequent execution time: 155ms