CREATE OR REPLACE PROCEDURE sp_transfer_money(
	sender_id INTEGER,
	receiver_id INTEGER,
	amount NUMERIC(10, 4)
) AS
$$
	DECLARE
		current_amount NUMERIC;
	BEGIN
		CALL sp_withdraw_money(sender_id, amount);
		CALL sp_deposit_money(receiver_id, amount);
		
		current_amount := (SELECT balance FROM accounts WHERE id = sender_id);
		
		IF current_amount < 0 THEN 
			ROLLBACK;
		END IF;
	END;
$$
LANGUAGE plpgsql;

