SELECT
	d.*,
	e.*
FROM
	employees AS e
JOIN 
	departments AS d
		ON
	d.id = e.department_id
;
