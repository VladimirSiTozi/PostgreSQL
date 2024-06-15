UPDATE
    addresses
SET
    country = CASE
        WHEN SUBSTRING(country, 1, 1) = 'B' Then 'Blocked'
        WHEN SUBSTRING(country, 1, 1) = 'T' Then 'Test'
        WHEN SUBSTRING(country, 1, 1) = 'P' Then 'In Progress'
        ELSE country
    END;