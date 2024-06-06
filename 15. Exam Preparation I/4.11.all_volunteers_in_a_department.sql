CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(
    searched_volunteers_department VARCHAR(30)
) RETURNS INTEGER
AS
$$
    DECLARE
        count_of_volunteer INTEGER;
    BEGIN
        count_of_volunteer := (SELECT COUNT(*) FROM volunteers
            AS v JOIN volunteers_departments AS vd
                ON v.department_id = vd.id
                    WHERE vd.department_name = searched_volunteers_department);
        RETURN count_of_volunteer;
    END;
$$
LANGUAGE plpgsql;