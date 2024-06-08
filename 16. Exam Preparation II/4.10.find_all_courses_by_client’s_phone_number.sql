CREATE OR REPLACE FUNCTION fn_courses_by_client(
    phone_num VARCHAR(20)
) RETURNS INTEGER
AS
$$
    DECLARE
        count_of_courses INTEGER;
    BEGIN
        count_of_courses := (SELECT COUNT(*) FROM clients AS cl
            JOIN courses AS co ON co.client_id = cl.id WHERE cl.phone_number = phone_num);
        RETURN count_of_courses;
    END;
$$
LANGUAGE plpgsql;