-- (e)
-- Created a view to get the list of movies with their tags
-- Print all movie titles that have 1 tag with 'good' in it and 1 tag with 'bad' in it. So there needs to be at least 2 tags for that movie.

DROP VIEW IF EXISTS movies_with_tags;

CREATE VIEW movies_with_tags
AS
SELECT movies.title, movies.mid, t.tid, tag
FROM movies
         join tags t on movies.mid = t.mid
         join tag_names tn on tn.tid = t.tid;

SELECT DISTINCT mt1.title
FROM movies_with_tags mt1
         join movies_with_tags mt2 on mt1.mid = mt2.mid and mt1.tid <> mt2.tid
where mt1.tag LIKE '%good%'
  and mt2.tag LIKE '%bad%';

-- View creation time: 3ms
-- First execution time: 31ms
-- Subsequent execution time: 24ms