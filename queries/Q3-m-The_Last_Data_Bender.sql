-- Movie duplicates
DROP VIEW IF EXISTS movie_duplicates CASCADE;
DROP VIEW IF EXISTS movie_without_duplicates CASCADE;

CREATE VIEW movie_duplicates AS
SELECT DISTINCT A.mid, B.mid AS duplicate_of, A.title
FROM movies A, movies B
WHERE B.title = A.title
    AND B.year = A.year
    AND B.rating = A.rating
    AND B.num_rating = A.num_rating
    AND B.mid < A.mid;

SELECT * FROM movie_duplicates;

CREATE VIEW movie_without_duplicates AS
SELECT *
FROM movies
WHERE mid NOT IN (SELECT mid FROM movie_duplicates);

SELECT * FROM movie_without_duplicates;

-- Tag names duplicates
-- There are no tag names duplicates.
SELECT DISTINCT A.tid, B.tid AS duplicate_of, A.tag
FROM tag_names A, tag_names B
WHERE B.tag = A.tag
    AND B.tid < A.tid;

-- There are no duplicates anywhere else, since everything has a key + foreign
-- key, which ensures uniqueness.

-- View creation time: 9ms
-- First execution time: 48ms
-- Subsequent execution time: 56ms