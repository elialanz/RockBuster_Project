-- Descriptive Analysis --

SELECT
	rating,
	COUNT(film_id) AS count_of_movies,
	AVG(rental_rate) AS average_movie_rental_rate,
	MAX(rental_duration) AS maximum_rental_duration,
	MIN(rental_duration) AS minimum_rental_duration
FROM film
WHERE
	rating IN ('PG', 'G')
GROUP BY
	rating;


-- DATA CHECK FOR CLEANING

SELECT
	film_id,
	COUNT(film_id) AS film_id_count
FROM
	film
GROUP BY
	film_id
HAVING
	COUNT(film_id) > 1
	
--

SELECT
	customer_id,
	COUNT(customer_id) AS customer_id_count
FROM
	customer
GROUP BY
	customer_id
HAVING
	COUNT(customer_id) > 1
ORDER BY
	customer_id ASC


-- EXAMPLES JOIN

SELECT
	FIL.film_id AS films_id,
	FIL.title AS films_title,
	FIL.release_year AS films_release_year,
	LAN.name AS language_name
FROM
	film FIL
INNER JOIN
	language LAN ON FIL.language_id = LAN.language_id
LIMIT 3;


-- Top 10 countries in terms of customer numbers

SELECT
	COUNT(customer_id) AS customer_count,
	CO.country
FROM
	customer CU
INNER JOIN
	address AD ON CU.address_id = AD.address_id
INNER JOIN
	city CI ON AD.city_id = CI.city_id
INNER JOIN
	country CO ON CI.country_id = CO.country_id
GROUP BY
	country
ORDER BY
	COUNT(customer_id) DESC
LIMIT 10;


-- Top 10 cities that fall within the top 10 countries

SELECT
	COUNT(customer_id) AS customer_count,
	CO.country,
	CI.city
FROM
	customer CU
INNER JOIN
	address AD ON CU.address_id = AD.address_id
INNER JOIN
	city CI ON AD.city_id = CI.city_id
INNER JOIN
	country CO ON CI.country_id = CO.country_id
WHERE
	CO.country IN
	('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil',
	'Russian Federation', 'Philippines', 'Turkey',  'Indonesia')
GROUP BY
	CO.country,
	CI.city
ORDER BY
	customer_count DESC
LIMIT 10;

-- Top 5 customers from the top 10 cities who’ve paid the highest total amounts

SELECT
	CU.customer_id,
	CU.first_name AS customer_firstname,
	CU.last_name AS customer_lastname,
	CO.country AS customer_city,
	CI.city AS customer_country,
	SUM(PA.amount) AS total_amount_paid
FROM
	payment PA
INNER JOIN
	customer CU ON PA.customer_id = CU.customer_id
INNER JOIN
	address AD ON CU.address_id = AD.address_id	
INNER JOIN
	city CI ON AD.city_id = CI.city_id
INNER JOIN
	country CO ON CI.country_id = CO.country_id
WHERE
	CI.city IN ('Aurora', 'Acua', 'Citrus Heights', 'Iwaki', 'Ambattur', 'Shanwei', 'So Leopoldo', 'Teboksary', 'Tianjin',  'Cianjur')
GROUP BY
	CU.customer_id,
	CO.country,
	CI.city
ORDER BY
	total_amount_paid DESC
LIMIT 5;