WITH top_customers_cte (customer_id, first_name, last_name, city, country, customer_total_amount) AS
	(SELECT
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
	LIMIT 5)
SELECT
	AVG(customer_total_amount) AS average_amount_paid
FROM
	top_customers_cte;