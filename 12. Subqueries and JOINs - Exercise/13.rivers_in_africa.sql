SELECT
	c.country_name,
	r.river_name
FROM
	countries AS c
JOIN
	continents AS co
USING
	(continent_code)
LEFT JOIN
	countries_rivers As cr
USING
	(country_code)
LEFT JOIN 
	rivers AS r
		ON
	r.id = cr.river_id
WHERE
	co.continent_name = 'Africa'
ORDER BY
	country_name ASC
LIMIT 
	5