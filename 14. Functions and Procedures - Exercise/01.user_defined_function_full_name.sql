CREATE OR REPLACE FUNCTION fn_full_name (
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)
RETURNS VARCHAR(101) AS
$$
	DECLARE
		full_name VARCHAR(101);
	BEGIN
		full_name := INITCAP(first_name) || ' ' || INITCAP(last_name);
		RETURN full_name;
	END;
$$
LANGUAGE plpgsql;

SELECT * FROM fn_full_name('fred', 'sanford');
SELECT * FROM fn_full_name('', 'SIMPSONS');
SELECT * FROM fn_full_name('JOHN', '');
SELECT * FROM fn_full_name(NULL, NULL);
