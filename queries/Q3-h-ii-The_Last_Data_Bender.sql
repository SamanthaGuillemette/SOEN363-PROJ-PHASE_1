-- (h)

-- ii. Use the above views to print the number of 'no flop' actors in the database.

DROP VIEW IF EXISTS no_flop;

CREATE VIEW no_flop
AS
SELECT name
FROM high_ratings
WHERE name NOT IN (SELECT name FROM low_ratings);

SELECT COUNT(*) AS no_flop_count
FROM no_flop;

-- View creation time: 2ms
-- First execution time: 130ms
-- Subsequent execution time: 125ms