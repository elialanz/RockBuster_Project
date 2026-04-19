-- JOIN AND EXTRACT TABLES FOR HIGHER GRANULARITY
-- THIS CSV WILL ALLOW MAJOR FLEXIBILITY WHEN IMPORTED INTO TABLEAU
-- VISUALIZATIONS: BEST PERFORMING CATEGORIES AND RATINGS, BEST GENRES COUNTRIES

SELECT
	PA.payment_id,
	CI.city,
	CO.country,
	CA.name AS film_category,
	FI.rating AS film_rating,
	PA.amount AS payment_amount
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
INNER JOIN
	customer CU ON PA.customer_id = CU.customer_id
INNER JOIN
	address AD ON CU.address_id = AD.address_id
INNER JOIN
	city CI ON AD.city_id = CI.city_id
INNER JOIN
	country CO ON CI.country_id = CO.country_id;