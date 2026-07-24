-- ==========================================
-- 02 - Qualidade dos Dados
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- 1. Verificar valores nulos
SELECT
    COUNT(*) FILTER (WHERE "passenger_count" IS NULL) AS passageiros_nulos,
    COUNT(*) FILTER (WHERE "RatecodeID" IS NULL) AS ratecode_nulos,
    COUNT(*) FILTER (WHERE "store_and_fwd_flag" IS NULL) AS store_nulos,
    COUNT(*) FILTER (WHERE "congestion_surcharge" IS NULL) AS congestion_nulos,
    COUNT(*) FILTER (WHERE "Airport_fee" IS NULL) AS airport_fee_nulos
FROM taxi_trips;


-- 2. Percentual de registros com passenger_count nulo
SELECT
    COUNT(*) FILTER (
        WHERE "passenger_count" IS NULL
    ) AS registros_nulos,

    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE "passenger_count" IS NULL
        ) / COUNT(*),
        2
    ) AS percentual_nulos

FROM taxi_trips;


-- 3. Verificar distâncias iguais a zero
SELECT
    COUNT(*) AS corridas_distancia_zero
FROM taxi_trips
WHERE trip_distance = 0;


-- 4. Verificar distâncias muito elevadas
SELECT
    COUNT(*) AS corridas_distancia_atipica
FROM taxi_trips
WHERE trip_distance > 100;


-- 5. Identificar as maiores distâncias
SELECT
    "VendorID",
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    trip_distance,
    total_amount
FROM taxi_trips
ORDER BY trip_distance DESC
LIMIT 20;


-- 6. Verificar valores financeiros negativos
SELECT
    COUNT(*) FILTER (WHERE fare_amount < 0) AS tarifas_negativas,
    COUNT(*) FILTER (WHERE total_amount < 0) AS totais_negativos,
    COUNT(*) FILTER (WHERE tip_amount < 0) AS gorjetas_negativas
FROM taxi_trips;


-- 7. Verificar duração das corridas
SELECT
    COUNT(*) AS total_corridas,
    MIN(
        EXTRACT(
            EPOCH FROM (
                tpep_dropoff_datetime - tpep_pickup_datetime
            )
        ) / 60
    ) AS duracao_minima_minutos,

    AVG(
        EXTRACT(
            EPOCH FROM (
                tpep_dropoff_datetime - tpep_pickup_datetime
            )
        ) / 60
    ) AS duracao_media_minutos,

    MAX(
        EXTRACT(
            EPOCH FROM (
                tpep_dropoff_datetime - tpep_pickup_datetime
            )
        ) / 60
    ) AS duracao_maxima_minutos

FROM taxi_trips;


-- 8. Identificar corridas com duração igual ou menor que zero
SELECT
    COUNT(*) AS duracoes_invalidas
FROM taxi_trips
WHERE tpep_dropoff_datetime <= tpep_pickup_datetime;


-- 9. Identificar corridas com duração superior a 3 horas
SELECT
    COUNT(*) AS corridas_duracao_atipica
FROM taxi_trips
WHERE
    EXTRACT(
        EPOCH FROM (
            tpep_dropoff_datetime - tpep_pickup_datetime
        )
    ) / 60 > 180;
