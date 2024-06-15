SELECT
    CONCAT(a.id, ' ', a.username) AS id_usernamem,
    a.email
FROM
    accounts AS a
JOIN
    accounts_photos AS ap
ON
    a.id = ap.account_id
WHERE
    ap.photo_id = a.id