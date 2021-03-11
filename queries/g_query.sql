-- (g) Print the movie title, year and rating of the lowest and highest movies for each year in 2005-2011 inclusive.
-- Assumption:
-- A movie needs to have a rating > 0, because we cannot say that a movie has the lowest rating if it has never been rated.
-- For that reason, there are no movies for year 2010 and 2011 because no movies have been rated during these years

DROP VIEW IF EXISTS year_ratings;

CREATE VIEW year_ratings
AS
SELECT year, MAX(rating) as max, MIN(rating) as min
FROM movies
where rating > 0
group by year;

SELECT distinct movies.year, title, rating
FROM movies
         join year_ratings yr on movies.year = yr.year and (rating = yr.max or rating = yr.min)
WHERE movies.year >= 2005
  and movies.year <= 2011
order by movies.year, rating, title;
