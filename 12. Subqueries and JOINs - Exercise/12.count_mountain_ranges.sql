SELECT
	mc.country_code,
	COUNT(*) AS cmountain_range_count
FROM
	mountains AS m
JOIN
	mountains_countries AS mc
		ON
	mc.mountain_id = m.id
WHERE
	mc.country_code IN ('US', 'RU', 'BG')
GROUP BY
	mc.country_code
ORDER BY
	cmountain_range_count DESC
;