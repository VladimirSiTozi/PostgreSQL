SELECT
	b.booking_id,
	c.first_name AS customer_name
FROM
	bookings AS b
JOIN
	customers AS c
USING
	(customer_id)
ORDER BY
	customer_name ASC;