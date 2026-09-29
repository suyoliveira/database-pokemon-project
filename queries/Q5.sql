CREATE VIEW vw_resumo_gerencial_pokemon AS
SELECT 
    generation AS generacao,
    type1 AS tipo_principal,
    COUNT(pokedex_number) AS total_pokemons,
    ROUND(AVG(attack), 2) AS media_ataque,
    ROUND(AVG(defense), 2) AS media_defesa,
    ROUND(AVG(hp), 2) AS media_hp,
    ROUND(AVG(speed), 2) AS media_velocidade,
    MAX(hp + attack + defense + speed) AS maior_total_status
FROM pokemon
GROUP BY generation, type1;


CREATE VIEW vw_detalhes_analiticos_pokemon AS
SELECT 
    pokedex_number AS id_pokedex,
    name AS nome,
    generation AS generacao,
    type1 AS tipo_1,
    COALESCE(type2, 'Nenhum') AS tipo_2,
    hp AS vida,
    attack AS ataque,
    defense AS defesa,
    speed AS velocidade,
    (hp + attack + defense + speed) AS total_atributos,
    CASE 
        WHEN type2 IS NOT NULL THEN 'Misto'
        ELSE 'Puro'
    END AS classificacao_tipo
FROM pokemon;
