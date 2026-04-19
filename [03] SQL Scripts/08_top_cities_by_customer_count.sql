-- Highest Revenue Genres and Ratings

SELECT
	PA.payment_id,
	CA.name AS film_category,
	FI.rating AS film_rating,
	SUM(AMOUNT) AS total_payment,
	SUM(amount) / COUNT(DISTINCT CA.name) AS category_total,
	SUM(amount) / COUNT(DISTINCT FI.rating) AS rating_total
FROM
	payment PA
INNER JOIN
	rental RE ON PA.rental_id = RE.rental_id
INNER JOIN
	inventory IV ON RE.inventory_id = IV.inventory_id
INNER JOIN
	film FI ON IV.film_id = FI.film_id
INNER JOIN
	film_category FC ON FI.film_id = FC.film_id
INNER JOIN
	category CA ON FC.category_id = CA.category_id
GROUP BY
	payment_id,
	film_category,
	film_rating	
ORDER BY
	film_category DESC,
	film_rating ASC