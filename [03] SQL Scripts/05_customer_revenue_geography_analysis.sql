-- Top 10 countries for Rockbuster in terms of customer numbers

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


-- Top 10 cities that fall within the top 10 countries

SELECT
	CO.country,
	CI.city,
	COUNT(CU.customer_id) AS city_total_customers
FROM
	country CO
INNER JOIN
	city CI ON CO.country_id = CI.country_id
INNER JOIN
	address AD ON CI.city_id = AD.city_id
INNER JOIN
	customer CU ON AD.address_id = CU.address_id
WHERE
	CO.country IN ('India', 'China', 'United States',
	'Japan', 'Mexico', 'Brazil', 'Russian Federation',
	'Philippines', 'Turkey', 'Indonesia')
GROUP BY
	CO.country, CI.city
ORDER BY
	city_total_customers DESC
LIMIT 10


-- Top 5 customers from the top 10 cities

SELECT
	CU.customer_id,
	CU.first_name AS customer_firstname,
	CU.last_name AS customer_lastname,
	CI.city AS customer_city,
	CO.country AS customer_country,
	SUM(PA.amount) AS customer_total_amount
FROM
	customer CU
INNER JOIN
	address AD ON CU.address_id = AD.address_id
INNER JOIN
	city CI ON AD.city_id = CI.city_id
INNER JOIN
	country CO ON CI.country_id = CO.country_id
INNER JOIN
	payment PA ON CU.customer_id = PA.customer_id
WHERE
	CI.city IN ('Aurora', 'Acua', 'Citrus Heights',
	'Iwaki', 'Ambattur', 'Shanwei', 'So Leopoldo',
	'Teboksary', 'Tianjin', 'Cianjur')
GROUP BY
	CU.customer_id,
	CU.first_name,
	CU.last_name,
	CI.city,
	CO.country
ORDER BY
	customer_total_amount DESC
LIMIT 5