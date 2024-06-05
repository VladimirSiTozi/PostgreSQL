CREATE OR REPLACE PROCEDURE sp_deposit_money(
	account_id INTEGER,
	money_amount NUMERIC(10, 4)
) AS
$$
	BEGIN
		UPDATE 
			accounts
		SET
			balance = balance + money_amount
		WHERE
			accounts.id = account_id;
	END;
$$
LANGUAGE plpgsql;

CALL sp_deposit_money(1, 200);
SELECT * FROM accounts WHERE id = 1;

CALL sp_deposit_money(10, 500);
SELECT * FROM accounts WHERE id = 10;

CALL sp_deposit_money(14, 1000);
SELECT * FROM accounts WHERE id = 14;