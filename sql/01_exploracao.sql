-- ==========================================
-- 01 - Exploração Inicial dos Dados
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- Quantidade total de registros
SELECT COUNT(*) AS total_registros
FROM taxi_trips;


-- Quantidade de colunas
-- A quantidade de colunas pode ser consultada
-- através do catálogo do PostgreSQL

SELECT COUNT(*) AS total_colunas
FROM information_schema.columns
WHERE table_name = 'taxi_trips';


-- Visualização das primeiras linhas
SELECT *
FROM taxi_trips
LIMIT 10;


-- Período dos dados
SELECT
    MIN(tpep_pickup_datetime) AS primeira_corrida,
    MAX(tpep_pickup_datetime) AS ultima_corrida
FROM taxi_trips;


-- Estatísticas básicas da distância
SELECT
    COUNT(*) AS total_corridas,
    MIN(trip_distance) AS distancia_minima,
    AVG(trip_distance) AS distancia_media,
    MAX(trip_distance) AS distancia_maxima
FROM taxi_trips;
