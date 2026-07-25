-- ==========================================
-- 03 - Análise Operacional
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- 1. Total de corridas por dia

SELECT
    DATE(tpep_pickup_datetime) AS data,
    COUNT(*) AS quantidade_corridas
FROM taxi_trips
WHERE
    tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01'
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY data;


-- 2. Corridas por hora do dia

SELECT
    EXTRACT(HOUR FROM tpep_pickup_datetime) AS hora,
    COUNT(*) AS quantidade_corridas
FROM taxi_trips
WHERE
    tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01'
GROUP BY EXTRACT(HOUR FROM tpep_pickup_datetime)
ORDER BY hora;


-- 3. Corridas por dia da semana

SELECT
    TO_CHAR(
        tpep_pickup_datetime,
        'Day'
    ) AS dia_semana,
    COUNT(*) AS quantidade_corridas
FROM taxi_trips
WHERE
    tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01'
GROUP BY
    TO_CHAR(tpep_pickup_datetime, 'Day'),
    EXTRACT(DOW FROM tpep_pickup_datetime)
ORDER BY
    EXTRACT(DOW FROM tpep_pickup_datetime);


-- 4. Distância média por corrida

SELECT
    ROUND(AVG(trip_distance)::numeric, 2) AS distancia_media
FROM taxi_trips
WHERE
    trip_distance > 0
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


-- 5. Duração média das corridas

SELECT
    ROUND(
        AVG(
            EXTRACT(
                EPOCH FROM (
                    tpep_dropoff_datetime
                    - tpep_pickup_datetime
                )
            ) / 60
        )::numeric,
        2
    ) AS duracao_media_minutos
FROM taxi_trips
WHERE
    tpep_dropoff_datetime > tpep_pickup_datetime
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


-- 6. Top 10 zonas de embarque

SELECT
    "PULocationID" AS zona_embarque,
    COUNT(*) AS quantidade_corridas
FROM taxi_trips
WHERE
    tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01'
GROUP BY "PULocationID"
ORDER BY quantidade_corridas DESC
LIMIT 10;


-- 7. Top 10 rotas mais utilizadas

SELECT
    "PULocationID" AS zona_origem,
    "DOLocationID" AS zona_destino,
    COUNT(*) AS quantidade_corridas
FROM taxi_trips
WHERE
    tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01'
GROUP BY
    "PULocationID",
    "DOLocationID"
ORDER BY quantidade_corridas DESC
LIMIT 10;
