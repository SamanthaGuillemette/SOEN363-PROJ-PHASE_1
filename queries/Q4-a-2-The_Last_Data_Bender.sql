-- 4a.2)
-- Re-implement your answer for question 3-k-2 using materialized views.
--  View to get co-actor count of all actors
CREATE MATERIALIZED VIEW co_actor_count as
SELECT A1.name, count(DISTINCT A2.name)
FROM mw_actors as A1,
     mw_actors as A2
WHERE A1.mid = A2.mid
  and A1.name <> A2.name
GROUP BY A1.name;

-- Get the actors with the highest co-actor count sorted by name
SELECT co_actor_count.name, co_actor_count.count
FROM co_actor_count,
     (SELECT MAX(co_actor_count.count) FROM co_actor_count) as max
WHERE co_actor_count.count = max
ORDER BY co_actor_count.name;

-- Materliazed View creation time: 48ms
-- First execution time: 105ms
-- Subsequent execution time: 65ms