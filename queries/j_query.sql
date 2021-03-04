-- (j) 1.
-- First, create a view called 'co_actors', which returns the distinct names of
-- actors who played in at least one movie with Annette Nicole. Print the number
-- of rows in this view.

DROP VIEW IF EXISTS co_actors CASCADE;

CREATE VIEW co_actors
AS
SELECT DISTINCT actors.name
FROM actors JOIN (
  SELECT mid FROM actors WHERE name = 'Annette Nicole'
) AS movies ON actors.mid = movies.mid;

SELECT count(*) from co_actors;

-- (j) 2.
-- Second, create a view called 'all_combinations' which returns all possible
-- combinations of 'co_actors' and the movie ids in which Annette Nicole played.
-- Print the number of rows in this view. Note how that this view contains fake
-- (co_actor, mid) combinations!

DROP VIEW IF EXISTS all_combinations CASCADE;

CREATE VIEW all_combinations
AS
SELECT DISTINCT name, mid
FROM co_actors, (
  SELECT mid FROM actors WHERE name = 'Annette Nicole'
) AS movies;

SELECT count(*) from all_combinations;

-- (j) 3.
-- Third, create a view called 'non_existent' from the view 'all_combinations'
-- by removing all legitimate (co_actor, mid) pairs (i.e., pairs that exist in
-- the actors table). Print the number of rows in this view.

DROP VIEW IF EXISTS existent;
DROP VIEW IF EXISTS non_existent;

CREATE VIEW existent
AS
SELECT DISTINCT actors.name, actors.mid
FROM actors JOIN (
    SELECT mid FROM actors WHERE name = 'Annette Nicole'
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

SELECT count(*) from non_existent;

-- (j) 4.
-- Finally, from the view 'co_actors', eliminate the distinct actors that appear in
-- the view 'non_existent'. Print the names of all 'co_actors' except
-- Annette Nicole.

DROP VIEW IF EXISTS friends;

CREATE VIEW friends
AS
SELECT co_actors.name
FROM co_actors
WHERE
  co_actors.name != 'Annette Nicole'
  and co_actors.name NOT IN (SELECT name FROM non_existent);

SELECT * from friends;