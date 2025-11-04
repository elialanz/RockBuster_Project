/*	Check for and clean dirty data: Find out if the film table and the customer table
	contain any dirty data, specifically non-uniform or duplicate data, or missing values.
	Create a new “Answers 3.6” document and copy-paste your queries into it.
	Next to each query write 2 to 3 sentences explaining how you would clean the data
	(even if the data is not dirty). */

SELECT *
FROM film

SELECT *
FROM customer

-- Check for duplicate data in the Film Table

SELECT
	film_id,
	title,
	description,
	release_year,
	language_id,
	rental_duration,
	rental_rate,
	length,
	replacement_cost,
	rating,
	COUNT(*)
FROM
	film
GROUP BY
	film_id,
	title,
	release_year,
	language_id,
	rental_duration
HAVING COUNT(*) >1;

-- Check for duplicate data in the Customer Table

SELECT
	customer_id,
	store_id,
	first_name,
	last_name,
	email,
	address_id,
	active,
	COUNT(*)
FROM
	customer
GROUP BY
	customer_id,
	store_id,
	first_name,
	last_name,
	email,
	address_id,
	active
HAVING COUNT(*) >1;

-- Check for Non-Uniform data in the Film Table

-- Check Release Year Inconsistent Data

SELECT release_year AS release_year_count,
       COUNT(*)
FROM film
GROUP BY release_year
ORDER BY COUNT(*)

-- Check Language ID Inconsistent Data

SELECT language_id AS language_id_count,
       COUNT(*)
FROM film
GROUP BY language_id
ORDER BY COUNT(*)

-- Check Rental Duration Inconsistent Data

SELECT rental_duration AS rental_duration_count,
       COUNT(*)
FROM film
GROUP BY rental_duration
ORDER BY rental_duration_count ASC

-- Check Rental Rate Inconsistent Data

SELECT rental_rate AS rental_rate_count,
       COUNT(*)
FROM film
GROUP BY rental_rate
ORDER BY rental_rate_count ASC

-- Check Replacement Cost Inconsistent Data

SELECT replacement_cost AS replacement_cost_count,
       COUNT(*)
FROM film
GROUP BY replacement_cost
ORDER BY replacement_cost_count ASC

-- Check Rating Inconsistent Data

SELECT rating AS rating_count,
       COUNT(*)
FROM film
GROUP BY rating
ORDER BY rating_count ASC

-- Check for Non-Uniform data in the Customer Table
-- Customer Table has less categories than Film Table, so in this case i will check only StoreID and Active Columns

-- Check Store ID Inconsistent Data

SELECT store_id AS store_id_count,
       COUNT(*)
FROM customer
GROUP BY store_id
ORDER BY COUNT(*)

-- Check Active Inconsistent Data

SELECT active AS active_count,
       COUNT(*)
FROM customer
GROUP BY active
ORDER BY COUNT(*)

-- Check for Missing Values in the Film Table

SELECT *
FROM film
WHERE
	film_id IS NULL
	OR title IS NULL
	OR description IS NULL
	OR release_year IS NULL
	OR language_id IS NULL
	OR rental_duration IS NULL
	OR rental_rate IS NULL
	OR length IS NULL
	OR replacement_cost IS NULL
	OR rating IS NULL

-- Extra Check for Blank Values String in the Film Table

SELECT *
FROM film
WHERE
	title = ' ' OR
	description = ' '

-- Extra Check for Blank Values String in the Customer Table

SELECT *
FROM customer
WHERE
	first_name = ' ' OR
	last_name = ' ' OR
	email = ' '

/*	Summarize your data: Use SQL to calculate descriptive statistics for both the film table and the customer table.
	For numerical columns, this means finding the minimum, maximum, and average values. For non-numerical columns,
	calculate the mode value. Copy-paste your SQL queries and their outputs into your answers document. */

-- Calculate Descriptive Statistics for the Film Table

SELECT MIN(replacement_cost) AS min_replacement_cost,
       MAX(replacement_cost) AS max_replacement_cost,
       AVG(replacement_cost) AS avg_replacement_cost,
       COUNT(replacement_cost) AS count_replacement_cost,
       COUNT(*) AS count_rows
FROM film;

-- Calculate Descriptive Statistics for the Film Table (Mode)

SELECT
	MODE() WITHIN GROUP (ORDER BY title) AS modal_title,
	MODE() WITHIN GROUP (ORDER BY rating) AS modal_rating
FROM film

-- Calculate Descriptive Statistics for the Customer Table (Mode)

SELECT
	MODE() WITHIN GROUP (ORDER BY first_name) AS modal_first_name,
	MODE() WITHIN GROUP (ORDER BY last_name) AS modal_last_name,
	MODE() WITHIN GROUP (ORDER BY email) AS modal_email,
	MODE() WITHIN GROUP (ORDER BY active) AS modal_active
FROM customer