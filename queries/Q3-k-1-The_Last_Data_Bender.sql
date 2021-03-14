-- (k)

-- 1. Tom Cruise and distinct co-actor count
SELECT A1.name, count(DISTINCT A2.name)
FROM actors as A1,
     actors as A2
WHERE A1.name = 'Tom Cruise'
  and A1.mid = A2.mid
  and A1.name <> A2.name
GROUP BY A1.name;

-- First execution time: 54ms
-- Subsequent execution time: 32ms
