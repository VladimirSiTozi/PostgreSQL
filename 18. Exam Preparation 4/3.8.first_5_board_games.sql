SELECT
    bg.name,
    bg.rating,
    c.name
FROM
    board_games AS bg
JOIN
    players_ranges AS pr
ON
    bg.players_range_id = pr.id
JOIN
    categories AS c
ON
    c.id = bg.category_id
WHERE
    (
		bg.rating > 7
		AND
		bg."name" ILIKE '%a%'
	)
	OR
	(
		bg.rating > 7.50
		AND
		pr.min_players >= 2
		AND
		pr.max_players <= 5
	)
ORDER BY
    bg.name ASC,
    bg.rating DESC
LIMIT
    5