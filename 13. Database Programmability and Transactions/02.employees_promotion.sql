CREATE OR REPLACE PROCEDURE sp_increase_salaries(
    IN department_name VARCHAR(50)
) AS
$$
    BEGIN
        UPDATE employees
        SET salary = salary * 1.05
        WHERE department_id =
        (SELECT department_id FROM departments WHERE department_name = name);
    end;
$$
LANGUAGE plpgsql;