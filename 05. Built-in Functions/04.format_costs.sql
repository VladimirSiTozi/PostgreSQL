SELECT
	title,
	round(cost, 3) AS modified_pric
FROM
	books
ORDER BY
	id ASC;