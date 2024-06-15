CREATE OR REPLACE FUNCTION udf_accounts_photos_count(
    account_username VARCHAR(30)
) RETURNS INTEGER
AS
    $$
        DECLARE
            number_of_photos INTEGER;
        BEGIN
            number_of_photos := (SELECT
                COUNT(a.id)
            FROM
                accounts as a
            JOIN
                accounts_photos AS ap
            ON
                a.id = ap.account_id
            WHERE
                a.username = account_username);
            RETURN number_of_photos;
        END;
    $$
LANGUAGE plpgsql;
