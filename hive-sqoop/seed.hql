-- Criando tabelas de etapa para não dar erro de formato ao fazer o LOAD DATA (.csv para .orc)
CREATE TABLE IF NOT EXISTS work_dataeng.generation_oliveira_stage (
    generation INT, 
    date_introduced DATE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");

CREATE TABLE IF NOT EXISTS work_dataeng.pokemon_guilherme_stage (
    idnum INT, 
    name STRING, 
    hp INT, 
    speed INT, 
    attack INT, 
    special_attack INT, 
    defense INT, 
    special_defense INT, 
    generation INT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1");

-- Carregando dados dos .csv nas tabelas de etapas (pedir pro DevOps da squad rodar)
LOAD DATA INPATH '/user/2rp-guilhermeo/pokemon_csv/generation.csv' 
INTO TABLE work_dataeng.generation_oliveira_stage;

LOAD DATA INPATH '/user/2rp-guilhermeo/pokemon_csv/pokemon.csv' 
INTO TABLE work_dataeng.pokemon_guilherme_stage;

-- Transferir dados das tabelas de etapa para as tabelas .orc
INSERT INTO TABLE generation_oliveira
SELECT * FROM work_dataeng.generation_oliveira_stage;

INSERT INTO TABLE pokemon_guilherme
SELECT * FROM work_dataeng.pokemon_guilherme_stage;

-- JOIN (OBS.: O Apache Impala não aceita DATE, portanto é necessário tirar a coluna date_introduced do SELEC)
SELECT t1.*, t2.* FROM work_dataeng.pokemon_guilherme t1 JOIN work_dataeng.generation_oliveira t2 
ON t1.generation = t2.generation;

-- Tempo de execução em Hive terça-feira, 11:03, 22/03/2022 
-- 1min 38sec

-- Tempo de execução em Impala terça-feira, 11:05, 22/03/2022 
-- 1sec 73millisec

-- Criando View da tabela para ser importada para o Superset
CREATE VIEW IF NOT EXISTS pokemon_geracao_guilherme
AS SELECT 
t1.generation AS generation, 
t1.idnum AS idnum,
t1.hp AS hp,

t2.date_introduced AS date_introduced
FROM work_dataeng.pokemon_guilherme t1 JOIN work_dataeng.generation_oliveira t2 
ON t1.generation = t2.generation;

-- Como eu esqueci de excluir o header do .csv no momento da criação da tabela, precisei excluir a primeira linha usando o seguinte comando:
-- INSERT OVERWRITE TABLE pokemon_guilherme SELECT * FROM pokemon_guilherme WHERE idnum>=1;
