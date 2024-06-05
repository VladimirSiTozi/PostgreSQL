CREATE OR REPLACE FUNCTION fn_is_word_comprised(
	set_of_letters VARCHAR(50),
	word VARCHAR(50)
) RETURNS BOOLEAN 
AS
$$
	DECLARE
		result_text VARCHAR(101);
		exit_result BOOLEAN;
	BEGIN
		result_text := TRIM(LOWER(word), LOWER(set_of_letters));
		IF
			result_text = '' THEN
			exit_result := true;
		ELSE
			exit_result := false;
		END IF;
		RETURN exit_result;
	END;
$$
LANGUAGE plpgsql;