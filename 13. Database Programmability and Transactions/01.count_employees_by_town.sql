CREATE OR REPLACE FUNCTION fn_count_employees_by_town(
    town_name VARCHAR(30)
) RETURNS INTEGER
AS
$$
    DECLARE
        number_of_employees INTEGER;
    BEGIN
        number_of_employees := (SELECT
            COUNT(*)
        FROM
            employees AS e
        JOIN
            addresses AS a
        USING
            (address_id)
        JOIN
            towns AS t
        USING
            (town_id)
        WHERE town_name = t.name);
    RETURN number_of_employees;
    END;
$$
LANGUAGE plpgsql;