-- 3l)
-- Verify if duplicates and create view with no duplicates
-- actors
DO $$
    BEGIN
        PERFORM  mid, name, cast_position, COUNT(*)
        FROM actors
        GROUP BY mid, name, cast_position
        HAVING COUNT(*) > 1;
        if found then
            CREATE OR REPLACE VIEW actors_no_dup as SELECT DISTINCT mid, name, cast_position
                                                    FROM actors;
        end if;
    END$$;

--genres
DO $$
    BEGIN
        PERFORM  mid, genre, COUNT(*)
        FROM genres
        GROUP BY mid, genre
        HAVING COUNT(*) > 1;
        if found then
            CREATE OR REPLACE VIEW genres_no_dup as SELECT DISTINCT mid, genre
                                                    FROM genres;
        end if;
    END$$;

--movies
DO $$
    BEGIN
        PERFORM  mid, title, year,rating,num_rating, COUNT(*)
        FROM movies
        GROUP BY mid, title, year,rating,num_rating
        HAVING COUNT(*) > 1;
        if found then
            CREATE OR REPLACE VIEW movies_no_dup as SELECT DISTINCT mid, title, year,rating,num_rating
                                                    FROM movies;
        end if;
    END$$;

--tag_names
DO $$
    BEGIN
        PERFORM  tid, tag, COUNT(*)
        FROM tag_names
        GROUP BY tid, tag
        HAVING COUNT(*) > 1;
        if found then
            CREATE OR REPLACE VIEW tag_no_dup as SELECT DISTINCT tid, tag
                                                 FROM tag_names;
        end if;
    END$$;


--tags
DO $$
    BEGIN
        PERFORM  mid, tid, COUNT(*)
        FROM tags
        GROUP BY mid, tid
        HAVING COUNT(*) > 1;
        if found then
            CREATE OR REPLACE VIEW tag_no_dup as SELECT DISTINCT mid, tid
                                                 FROM tags;
        end if;
    END$$;
