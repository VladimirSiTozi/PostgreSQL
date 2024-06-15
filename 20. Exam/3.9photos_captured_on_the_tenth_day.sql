SELECT
    CONCAT(SUBSTRING(description,1 , 10), '...') AS summary,
    TO_CHAR(capture_date, 'DD.MM HH24:MI' ) AS date
FROM
    photos
WHERE
    TO_CHAR(capture_date, 'DD') = '10'
ORDER BY
    capture_date DESC