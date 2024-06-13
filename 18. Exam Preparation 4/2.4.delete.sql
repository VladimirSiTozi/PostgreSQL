DELETE FROM addresses CASCADE
WHERE
    SUBSTRING(town, 1, 1) = 'L'
;
