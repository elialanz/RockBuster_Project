SELECT
	country,
	COUNT(DISTINCT CU.customer_id) AS customer_count,
	SUM(AMOUNT) AS total_payment
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
ORDER BY
	total_payment DESC