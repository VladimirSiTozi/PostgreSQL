SELECT 
	start_point,
	end_point,
	leader_id,
	CONCAT(c.first_name, ' ', c.last_name) AS leader_name
FROM 
	routes AS r
JOIN
	campers AS c
		ON
	c.id = r.leader_id