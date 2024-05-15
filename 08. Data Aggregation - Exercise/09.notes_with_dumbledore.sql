SELECT 
	last_name,
	COUNT(notes) AS notes_with_dumbledore
FROM 
	wizard_deposits
WHERE 
	notes ILIKE '%Dumbledore%'
GROUP BY
	last_name
;