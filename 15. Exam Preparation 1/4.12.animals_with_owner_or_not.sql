CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    OUT out_name VARCHAR(30)
) AS
$$
    BEGIN
        SELECT o.name
            FROM animals AS a
                RIGHT JOIN owners AS o
                     ON o.id = a.owner_id
                         WHERE a.name = animal_name
        INTO out_name;
        IF out_name IS NULL THEN
            out_name := 'For adoption';
        END IF;
        RETURN;
    END;
$$
LANGUAGE plpgsql;

CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish');

CALL sp_animals_with_owners_or_not('Hippo');

CALL sp_animals_with_owners_or_not('Brown bear')

