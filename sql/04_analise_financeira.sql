-- ==========================================
-- 04 - Análise Financeira
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- 1. Receita total

SELECT
    ROUND(SUM(total_amount)::numeric, 2) AS receita_total
FROM taxi_trips
WHERE
    total_amount > 0
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


-- 2. Ticket médio

SELECT
    ROUND(AVG(total_amount)::numeric, 2) AS ticket_medio
FROM taxi_trips
WHERE
    total_amount > 0
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


-- 3. Receita média por corrida

SELECT
    ROUND(AVG(total_amount)::numeric, 2)
        AS receita_media_por_corrida
FROM taxi_trips
WHERE
    total_amount > 0;


-- 4. Total de gorjetas

SELECT
    ROUND(SUM(tip_amount)::numeric, 2)
        AS total_gorjetas
FROM taxi_trips
WHERE
    tip_amount > 0;


-- 5. Receita por dia

SELECT
    DATE(tpep_pickup_datetime) AS data,
    COUNT(*) AS quantidade_corridas,
    ROUND(SUM(total_amount)::numeric, 2)
        AS receita_total,
    ROUND(AVG(total_amount)::numeric, 2)
        AS ticket_medio
FROM taxi_trips
WHERE
    total_amount > 0
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01'
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY data;


-- 6. Receita por zona de embarque

SELECT
    "PULocationID" AS zona_embarque,
    COUNT(*) AS quantidade_corridas,
    ROUND(SUM(total_amount)::numeric, 2)
        AS receita_total,
    ROUND(AVG(total_amount)::numeric, 2)
        AS ticket_medio
FROM taxi_trips
WHERE
    total_amount > 0
GROUP BY "PULocationID"
ORDER BY receita_total DESC
LIMIT 10;


-- 7. Receita por tipo de pagamento

SELECT
    payment_type,
    COUNT(*) AS quantidade_corridas,
    ROUND(SUM(total_amount)::numeric, 2)
        AS receita_total,
    ROUND(AVG(total_amount)::numeric, 2)
        AS ticket_medio
FROM taxi_trips
WHERE
    total_amount > 0
GROUP BY payment_type
ORDER BY receita_total DESC;
