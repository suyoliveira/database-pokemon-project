DELIMITER $$

CREATE PROCEDURE relatorio_pokemon(
    IN p_tipo VARCHAR(79),
    IN p_geracao INT
)
BEGIN


    IF p_geracao < 1 OR p_geracao > 6 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'a geração deve estar entre 1 e 6';
    END IF;


    IF NOT EXISTS (
        SELECT 1
        FROM types
        WHERE LOWER(type_name) = LOWER(p_tipo)
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'tipo de Pokémon não encontrado.';
    END IF;

    
    SELECT
        t.type_name AS tipo,
        p_geracao AS geracao,

        COUNT(DISTINCT p.pok_id) AS quantidade_pokemon,

        SUM(bs.b_atk) AS soma_ataque,

        ROUND(AVG(bs.b_atk), 2) AS media_ataque,

        SUM(bs.b_hp) AS soma_hp,

        ROUND(AVG(bs.b_hp), 2) AS media_hp,

        ROUND(AVG(bs.b_hp + bs.b_atk + bs.b_def + bs.b_sp_atk + bs.b_sp_def + bs.b_speed), 2) AS media_status_total

    FROM pokemon p

    INNER JOIN pokemon_types pt
        ON p.pok_id = pt.pok_id

    INNER JOIN types t
        ON pt.type_id = t.type_id

    INNER JOIN base_stats bs
        ON p.pok_id = bs.pok_id

    WHERE
        LOWER(t.type_name) = LOWER(p_tipo)

        AND (
            (p_geracao = 1 AND p.pok_id BETWEEN 1 AND 151)
            OR
            (p_geracao = 2 AND p.pok_id BETWEEN 152 AND 251)
            OR
            (p_geracao = 3 AND p.pok_id BETWEEN 252 AND 386)
            OR
            (p_geracao = 4 AND p.pok_id BETWEEN 387 AND 493)
            OR
            (p_geracao = 5 AND p.pok_id BETWEEN 494 AND 649)
            OR
            (p_geracao = 6 AND p.pok_id BETWEEN 650 AND 721)
        )

    GROUP BY t.type_id, t.type_name;

END$$
