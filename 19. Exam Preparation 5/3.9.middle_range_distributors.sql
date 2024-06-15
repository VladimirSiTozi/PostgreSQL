SELECT
    d.name AS distributor_name,
    i.name AS ingredient_name,
    p.name AS product_name,
    AVG(rate) AS average_rate
FROM
    distributors AS d
JOIN
    ingredients AS i
ON
    d.id = i.distributor_id
JOIN
    products_ingredients AS pi
ON
    i.id = pi.ingredient_id
JOIN
    products AS p
ON
    p.id = pi.product_id
JOIN
    feedbacks AS f
ON
    p.id = f.product_id
GROUP BY
    distributor_name,
    ingredient_name,
    product_name
HAVING
    AVG(rate) BETWEEN 5 AND 8
ORDER BY
    distributor_name ASC,
    ingredient_name ASC,
    product_name ASC