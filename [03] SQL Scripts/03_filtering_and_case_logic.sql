-- Find movies where film length is more than 120 minutes and rental rate is more than 2.99

SELECT
	film_id,
	title,
	description,
	length,
	rental_rate
FROM film
WHERE length > 120 AND rental_rate > 2.99
ORDER BY length ASC

-- Rental duration is between 3 and 7 days (where 3 and 7 aren’t inclusive)

SELECT
	film_id,
	title,
	description,
	rental_duration
FROM film
WHERE rental_duration > 3 AND rental_duration < 7
ORDER BY rental_duration ASC

-- Film replacement cost is less than 14.99

SELECT
	film_id,
	title,
	description,
	replacement_cost
FROM film
WHERE replacement_cost < 14.99
ORDER BY replacement_cost ASC

-- Film rating is either PG or G

SELECT
	film_id,
	title,
	description,
	rating
FROM film
WHERE rating = 'PG' OR rating = 'G'
ORDER BY rating ASC

/*	The inventory team has asked for more informations such:
		count of the movies,
		average rental rate,
		and maximum and minimum rental durations. */

SELECT
    COUNT(film_id) AS count_of_movies,
    AVG(rental_rate) AS average_movie_rental_rate,
    MIN(rental_duration) AS minimum_rental_duration,
	MAX(rental_duration) AS maximum_rental_duration
FROM
    film
WHERE
    rating = 'PG' or rating = 'G'

/*	The customer team wants to see the previous fields you calculated, but grouped by rating.
	The totals in your results table should look the same but broken down by the rating
	column. */

SELECT
    rating,
    COUNT(film_id) AS count_of_movies,
    AVG(rental_rate) AS average_movie_rental_rate,
    MIN(rental_duration) AS minimum_rental_duration,
	MAX(rental_duration) AS maximum_rental_duration
FROM
    film
WHERE
    rating = 'PG' or rating = 'G'
GROUP BY
    rating;