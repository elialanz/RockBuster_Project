-- Explain

EXPLAIN
SELECT *
FROM film

EXPLAIN
SELECT title,
       description,
       release_year
FROM film

-- Order by

EXPLAIN
SELECT title,
       release_year
FROM film
ORDER BY title DESC

-- Limit

EXPLAIN
SELECT title,
       release_year
FROM film
ORDER BY title DESC
LIMIT 10

-- Group by

EXPLAIN
SELECT rating
FROM film

EXPLAIN
SELECT rating
FROM film
GROUP BY rating

-- Aggregate (Count)

EXPLAIN
SELECT rating,
       COUNT(film_id)
FROM film
GROUP BY rating

-- Aggregate (Average)

EXPLAIN
SELECT rating,
AVG(rental_duration)
FROM film
GROUP BY rating


EXPLAIN
SELECT
	rating,
	rental_rate,
COUNT(film_id)
FROM film
GROUP BY rating,
         rental_rate

-- Distinct

EXPLAIN
SELECT DISTINCT
	rating,
	release_year
FROM film


EXPLAIN
SELECT
	rating,
	release_year
FROM film
GROUP BY
	rating,
	release_year