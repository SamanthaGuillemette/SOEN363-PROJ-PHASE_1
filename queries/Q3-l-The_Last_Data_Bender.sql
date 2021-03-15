-- (l)

-- Create View with movie fraction of common actors
CREATE OR REPLACE VIEW fraction_common_actors as
SELECT common_count.mid1,
       common_count.mid2,
       CAST(common_count.common_actors_count as FLOAT) / total_actors_count as fraction
FROM (SELECT A1.mid as mid1, A2.mid as mid2, COUNT(A1.name) as common_actors_count
      FROM actors as A1,
           actors as A2
      WHERE A1.mid <> A2.mid
        and A1.name = A2.name
      GROUP BY A1.mid, A2.mid) as common_count,
     (SELECT A3.mid, COUNT(A3.name) as total_actors_count
      FROM actors as A3
      GROUP BY (A3.mid)) as total_count
WHERE common_count.mid1 = total_count.mid;

-- View creation time: 3ms

-- Create View with movie fraction of common tags
CREATE OR REPLACE VIEW fraction_common_tags as
SELECT common_count.mid1,
       common_count.mid2,
       CAST(common_count.common_tid_count as FLOAT) / total_count.total_tid_count as fraction
FROM (SELECT A1.mid as mid1, A2.mid as mid2, COUNT(A1.tid) as common_tid_count
      FROM tags as A1,
           tags as A2
      WHERE A1.mid <> A2.mid
        and A1.tid = A2.tid
      GROUP BY A1.mid, A2.mid) as common_count,
     (SELECT A3.mid, COUNT(A3.tid) as total_tid_count FROM tags as A3 GROUP BY (A3.mid)) as total_count
WHERE common_count.mid1 = total_count.mid;

-- View creation time: 3ms

-- Create View with movie fraction of common genres
CREATE OR REPLACE VIEW fraction_common_genre as
SELECT common_count.mid1,
       common_count.mid2,
       CAST(common_count.common_genre_count as FLOAT) / total_count.total_genre_count as fraction
FROM (SELECT A1.mid as mid1, A2.mid as mid2, COUNT(A1.genre) as common_genre_count
      FROM genres as A1,
           genres as A2
      WHERE A1.mid <> A2.mid
        and A1.genre = A2.genre
      GROUP BY A1.mid, A2.mid
     ) as common_count,
     (SELECT A3.mid, COUNT(A3.genre) as total_genre_count
      FROM genres as A3
      GROUP BY (A3.mid)
     ) as total_count
WHERE common_count.mid1 = total_count.mid;

-- View creation time: 2ms

-- Create View with the movie age gap
CREATE OR REPLACE VIEW movie_age_gap as
SELECT M1.mid                                                                     as mid1,
       M2.mid                                                                     as mid2,
       (1 - (CAST(ABS(M1.year - M2.year) as FLOAT) / GREATEST(M1.year, M2.year))) as age_gap
FROM movies as M1,
     movies as M2
WHERE M1.mid <> M2.mid;

-- View creation time: 4ms

-- Create View with the movie rating gap
CREATE OR REPLACE VIEW movie_rating_gap as
SELECT M1.mid                                                              as mid1,
       M2.mid                                                              as mid2,
       (1 - (ABS(M1.rating - M2.rating) / GREATEST(M1.rating, M2.rating))) as rating_gap
FROM movies as M1,
     movies as M2
WHERE M1.mid <> M2.mid
  and M1.num_rating > 0
  and M2.num_rating > 0;

-- View creation time: 5ms

-- Query to get the top 10 similar movies
SELECT M2.title,
       M2.rating,
       ((CAST(FA.fraction + FT.fraction + FG.fraction + AG.age_gap + RG.rating_gap as FLOAT) / 5) * 100) as similarity
FROM movies M1,
     movies M2,
     movie_rating_gap RG,
     movie_age_gap AG,
     fraction_common_actors FA,
     fraction_common_tags FT,
     fraction_common_genre FG
WHERE M1.title = 'Mr. & Mrs. Smith'
  and RG.mid1 = M1.mid
  and RG.mid2 = M2.mid
  and AG.mid1 = M1.mid
  and AG.mid2 = M2.mid
  and FA.mid1 = M1.mid
  and FA.mid2 = M2.mid
  and FT.mid1 = M1.mid
  and FT.mid2 = M2.mid
  and FG.mid1 = M1.mid
  and FG.mid2 = M2.mid
ORDER BY (similarity) DESC
LIMIT 10;

-- First execution time: 1min 23s 774ms
-- Subsequent execution time: 1min 22s 55ms