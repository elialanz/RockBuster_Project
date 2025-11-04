/*	Write a query to find the top 10 countries for Rockbuster in terms of customer numbers.
	(Tip: you’ll have to use GROUP BY and ORDER BY, both of which follow the join.)
	Copy-paste your query and its output into your answers document.
	Write a few sentences on how you approached this query and why.
	You must be able to explain your thought process when writing queries, especially for future interviews. */

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

/*	Next, write a query to identify the top 10 cities that fall within
	the top 10 countries you identified in step 1.
	(Hint: the top 10 cities can be in any of the countries identified,
	you don’t need to create a separate list for each country.)
	Copy-paste your query and its output into your answers document.
	Write a short explanation of how you approached this query and why. */

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

/*	Now write a query to find the top 5 customers from the top 10 cities
	who’ve paid the highest total amounts to Rockbuster. The customer
	team would like to reward them for their loyalty!
	Tip: After the join syntax, you’ll need to use the WHERE clause with
	an operator, followed by GROUP BY and ORDER BY. Your output should
	include the following columns: Customer ID, Customer First Name and Last Name,
	Country, City, and Total Amount Paid.
	Copy-paste your query and its output into your answers document. */

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