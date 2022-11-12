-- 1.sql
SELECT title FROM movies WHERE year LIKE "2008";
-- 2.sql
SELECT birth FROM people WHERE name LIKE "Emma Stone";
-- 3.sql
SELECT title FROM movies WHERE year>="2018" ORDER BY title;
-- 4.sql
SELECT COUNT(title) FROM movies WHERE id IN (SELECT movie_id FROM ratings WHERE rating LIKE "10.0");
-- 5.sql
SELECT title, year FROM movies WHERE title LIKE "Harry Potter%" ORDER BY year;
-- 6.sql
SELECT avg(rating) FROM ratings WHERE movie_id IN (SELECT id FROM movies WHERE year = "2012");
-- 7.sql
SELECT title, rating FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE year = "2010" ORDER BY rating DESC, title;
-- 8.sql
SELECT name FROM movies JOIN stars ON movies.id = stars.movie_id JOIN people ON stars.person_id = people.id WHERE title = "Toy Story";
-- 9.sql
SELECT name FROM people WHERE id IN (SELECT DISTINCT stars.person_id FROM stars JOIN movies ON movies.id = stars.movie_id WHERE year = "2004") ORDER BY birth;
-- 10.sql
SELECT name FROM people WHERE id IN (SELECT DISTINCT directors.person_id FROM directors JOIN movies ON movies.id = directors.movie_id WHERE id IN (SELECT movie_id FROM ratings WHERE rating >= "9.0"));
-- 11.sql
SELECT title FROM movies JOIN ratings ON movies.id = ratings.movie_id WHERE id IN (SELECT stars.movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name LIKE "Chadwick Boseman")) ORDER BY rating DESC LIMIT 5;
-- 12.sql
SELECT title FROM movies WHERE id IN (SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Helena Bonham Carter") INTERSECT SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Johnny Depp"));
--13.sql
SELECT name FROM people WHERE name != "Kevin Bacon" AND id IN (SELECT DISTINCT person_id FROM stars WHERE movie_id IN (SELECT movie_id FROM stars WHERE person_id IN (SELECT id FROM people WHERE name = "Kevin Bacon" AND birth = "1958")));
