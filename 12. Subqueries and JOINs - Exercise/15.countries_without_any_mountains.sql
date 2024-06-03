SELECT
	COUNT(*) AS countries_without_mountains
FROM	
	countries AS cou
		LEFT JOIN mountains_countries AS mc
			USING(country_code)
-- 				LEFT JOIN mountains AS m
-- 					ON m.id = mc.mountain_id
WHERE mc.mountain_id IS NULL
;