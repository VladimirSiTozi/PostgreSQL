CREATE OR REPLACE FUNCTION fn_creator_with_board_games(
    creator_first_name VARCHAR(30)
) RETURNS INTEGER
AS
    $$
    DECLARE
        total_creators INTEGER;
    BEGIN
        total_creators := (SELECT
            COUNT(*)
        FROM
            creators AS c
        JOIN
            creators_board_games AS cbg
        ON
            c.id = cbg.creator_id
        JOIN
            board_games AS bg
        ON
            cbg.board_game_id = bg.id
        WHERE
            c.first_name = creator_first_name);
        RETURN total_creators;
    END;
    $$
LANGUAGE plpgsql;
