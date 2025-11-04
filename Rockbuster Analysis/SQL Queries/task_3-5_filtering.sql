-- Film title contains the word Uptown in any position

SELECT
	film_id,
	title,
	description
FROM film
WHERE title LIKE '%Uptown%'
ORDER BY title ASC

-- Film length is more than 120 minutes and rental rate is more than 2.99

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

/*	The query you wrote in step 1e returned a list of movies with a film rating of either PG or G.
	The inventory team has asked for more information about this list:
	count of the movies,
	average rental rate,
	and maximum and minimum rental durations.
	Run the query and transfer the code you used and your results onto a new sheet in your Excel file.
	To make the output easier for your coworkers to understand, give your aggregate columns the following aliases:
	“count of movies”
	“average movie rental rate”
	“maximum rental duration”
	“minimum rental duration” */

SELECT
    COUNT(film_id) AS count_of_movies,
    AVG(rental_rate) AS average_movie_rental_rate,
    MIN(rental_duration) AS minimum_rental_duration,
	MAX(rental_duration) AS maximum_rental_duration
FROM
    film
WHERE
    rating = 'PG' or rating = 'G'

/*	The customer team wants to see the fields you calculated in step 3 grouped by rating.
	The totals in your results table should look the same but broken down by the rating
	column. Copy-paste your query and its output onto a new sheet. */

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