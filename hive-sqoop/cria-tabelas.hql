CREATE TABLE IF NOT EXISTS work_dataeng.generation_oliveira (
    generation INT, 
    date_introduted DATE
) STORED AS orc;

CREATE TABLE IF NOT EXISTS work_dataeng.pokemon_guilherme (
    idnum INT, 
    name String, 
    hp INT, 
    speed INT, 
    attack INT, 
    special_attack INT, 
    defense INT, 
    special_defense INT, 
    generation INT
)STORED AS orc;
