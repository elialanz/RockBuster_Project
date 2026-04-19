SELECT
	CO.country,
	COUNT(CU.customer_id) AS country_total_customers
FROM
	country CO
INNER JOIN
	city CI ON CO.country_id = CI.country_id
INNER JOIN
	address AD ON CI.city_id = AD.city_id
INNER JOIN
	customer CU ON AD.address_id = CU.address_id
GROUP BY
	CO.country
ORDER BY
	country_total_customers DESC
LIMIT 10