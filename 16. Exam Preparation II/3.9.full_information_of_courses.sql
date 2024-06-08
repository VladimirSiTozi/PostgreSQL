SELECT
    a.name,
    CASE
        WHEN EXTRACT (HOURS FROM co.start) BETWEEN 6 AND 20 THEN 'Day'
        ELSE 'Night'
    END AS day_time,
    co.bill,
    cl.full_name,
    cr.make,
    cr.model,
    ct.name
FROM
    clients AS cl
JOIN
    courses AS co
ON
    cl.id = co.client_id
JOIN
    addresses AS a
ON
    co.from_address_id = a.id
JOIN
    cars AS cr
ON
    co.car_id = cr.id
JOIN
    categories AS ct
ON
    cr.category_id = ct.id
ORDER BY
    co.id
;