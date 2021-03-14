-- (k)

-- 2. View to get co-actor count of all actors
CREATE OR REPLACE VIEW co_actor_count as
SELECT A1.name, count(DISTINCT A2.name)
FROM actors as A1,
     actors as A2
WHERE A1.mid = A2.mid
  and A1.name <> A2.name
GROUP BY A1.name;

-- Get the actors with the highest co-actor count sorted by name
SELECT co_actor_count.name, co_actor_count.count
FROM co_actor_count,
     (SELECT MAX(count) FROM co_actor_count) as max
WHERE co_actor_count.count = max
ORDER BY co_actor_count.name;

-- View creation time: 2ms
-- First execution time: 30s 701ms
-- Subsequent execution time: 30s 700ms