-- (i)
-- Let us find out who is the actor with the highest ’longevity.’ Print the name
-- of the actor/ac-tress who has been playing in movies for the longest period
-- of time (i.e., the time interval between their first movie and their last
-- movie is the greatest).

DROP VIEW IF EXISTS longevity;

CREATE VIEW longevity
AS
SELECT DISTINCT name, (last_movie - first_movie) AS longevity
FROM (SELECT name, min(year) AS first_movie, max(year) AS last_movie
      FROM actors
               JOIN movies m ON m.mid = actors.mid
      GROUP BY name) AS playing;

SELECT name, longevity
FROM longevity
ORDER BY longevity DESC
LIMIT 1;

-- View creation time: 3ms
-- First execution time: 210ms
-- Subsequent execution time: 207ms