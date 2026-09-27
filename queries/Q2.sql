CREATE OR REPLACE VIEW view_qualidade_pokemon AS
SELECT 
    p.pok_id,
    p.pok_name,
    s.b_atk,
    s.b_def,
    (s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) AS total_stats,
    ROUND(AVG(s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) OVER(), 2) AS media_geral_stats,
    ROUND(((s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) - 
     AVG(s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) OVER()), 2) AS diferenca_da_media,
    CASE 
        WHEN ABS((s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) - 
                 AVG(s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) OVER()) > 150 
             THEN 'Prioridade 1 (Outlier Extremo)'
        WHEN ABS((s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) - 
                 AVG(s.b_hp + s.b_atk + s.b_def + s.b_sp_atk + s.b_sp_def + s.b_speed) OVER()) BETWEEN 80 AND 150 
             THEN 'Prioridade 2 (Fora do Padrão)'
        ELSE 'Prioridade 3 (Dentro do Esperado)'
    END AS score_prioridade
FROM pokemon p
JOIN base_stats s ON p.pok_id = s.pok_id;

-- VALIDAÇÃO
-- =============================================================================
-- VIEW completa:
-- SELECT * FROM view_qualidade_pokemon;

-- 2. Consultar apenas a lista de prioridade:
-- SELECT * FROM view_qualidade_pokemon WHERE score_prioridade LIKE 'Prioridade 1%';