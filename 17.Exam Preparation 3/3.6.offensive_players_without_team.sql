SELECT
    p.id,
    CONCAT(p.first_name, ' ', p.last_name) AS full_name,
    p.age,
    p.position,
    p.salary,
    sk.pace,
    sk.shooting
FROM
    players AS p
JOIN
    skills_data AS sk
ON
    p.skills_data_id = sk.id
WHERE
    position = 'A'
    AND
    team_id IS NULL
    AND
    sk.pace + sk.shooting > 130