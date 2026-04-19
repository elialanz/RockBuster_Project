-- Highest Paying Customers Compared to their Total Numbers

SELECT
	country,
	COUNT(DISTINCT CU.customer_id) AS customer_count,
	SUM(AMOUNT) AS total_payment,
	SUM(AMOUNT) / COUNT(DISTINCT CU.customer_id) AS spend_per_customer,
	AVG(PA.amount) AS avg_payment_per_rental
FROM
	customer CU
INNER JOIN
	address AD ON CU.address_id = AD.address_id
INNER JOIN
	city CI ON AD.city_id = Ci.city_id
INNER JOIN
	country CO ON CI.country_id = CO.country_id
INNER JOIN
	payment PA ON CU.customer_id = PA.customer_id
GROUP BY
	country
HAVING
	SUM(amount) / COUNT(DISTINCT CU.customer_id) >= 10 AND
	COUNT(DISTINCT CU.customer_id) >= 10
ORDER BY
	spend_per_customer DESC
LIMIT 5