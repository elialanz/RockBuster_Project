SELECT
	CO.country,
	COUNT(DISTINCT CU.customer_id) AS all_customer_count
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
	all_customer_count DESC