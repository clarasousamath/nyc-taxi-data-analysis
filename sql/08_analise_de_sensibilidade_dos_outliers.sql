/*
==========================================================
ANÁLISE DE SENSIBILIDADE DOS OUTLIERS
Projeto: NYC Taxi Data Analysis
Objetivo:
Avaliar o impacto da remoção de outliers nos principais
indicadores operacionais e financeiros.
==========================================================
*/

/*---------------------------------------------------------
1. Receita Total (Sem Outliers)
---------------------------------------------------------*/

SELECT
    ROUND(SUM(total_amount)::numeric, 2) AS receita_total
FROM taxi_trips
WHERE
    total_amount > 0
    AND trip_distance <= 100
    AND EXTRACT(
        EPOCH FROM (
            tpep_dropoff_datetime
            - tpep_pickup_datetime
        )
    ) / 60 <= 180
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


/*---------------------------------------------------------
2. Ticket Médio (Sem Outliers)
---------------------------------------------------------*/

SELECT
    ROUND(AVG(total_amount)::numeric, 2) AS ticket_medio
FROM taxi_trips
WHERE
    total_amount > 0
    AND trip_distance <= 100
    AND EXTRACT(
        EPOCH FROM (
            tpep_dropoff_datetime
            - tpep_pickup_datetime
        )
    ) / 60 <= 180
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


/*---------------------------------------------------------
3. Distância Média (Sem Outliers)
---------------------------------------------------------*/

SELECT
    ROUND(AVG(trip_distance)::numeric, 2) AS distancia_media
FROM taxi_trips
WHERE
    trip_distance > 0
    AND trip_distance <= 100
    AND EXTRACT(
        EPOCH FROM (
            tpep_dropoff_datetime
            - tpep_pickup_datetime
        )
    ) / 60 <= 180
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


/*---------------------------------------------------------
4. Duração Média (Sem Outliers)
---------------------------------------------------------*/

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
    ) AS duracao_media
FROM taxi_trips
WHERE
    total_amount > 0
    AND trip_distance <= 100
    AND EXTRACT(
        EPOCH FROM (
            tpep_dropoff_datetime
            - tpep_pickup_datetime
        )
    ) / 60 <= 180
    AND tpep_pickup_datetime >= '2026-04-01'
    AND tpep_pickup_datetime < '2026-05-01';


/*---------------------------------------------------------
5. Receita por Zona de Embarque (Sem Outliers)
---------------------------------------------------------*/

SELECT
    "PULocationID",
    COUNT(*) AS quantidade_corridas,
    ROUND(SUM(total_amount)::numeric, 2) AS receita_total
FROM taxi_trips
WHERE
    total_amount > 0
    AND trip_distance <= 100
    AND EXTRACT(
        EPOCH FROM (
            tpep_dropoff_datetime
            - tpep_pickup_datetime
        )
    ) / 60 <= 180
GROUP BY "PULocationID"
ORDER BY receita_total DESC
LIMIT 10;


/*---------------------------------------------------------
6. Percentual de Registros Mantidos
---------------------------------------------------------*/

SELECT
    COUNT(*) AS registros_originais,

    COUNT(*) FILTER (
        WHERE
            trip_distance <= 100
            AND EXTRACT(
                EPOCH FROM (
                    tpep_dropoff_datetime
                    - tpep_pickup_datetime
                )
            ) / 60 <= 180
    ) AS registros_sem_outliers,

    ROUND(
        (
            100.0 *
            COUNT(*) FILTER (
                WHERE
                    trip_distance <= 100
                    AND EXTRACT(
                        EPOCH FROM (
                            tpep_dropoff_datetime
                            - tpep_pickup_datetime
                        )
                    ) / 60 <= 180
            )
            / COUNT(*)
        )::numeric,
        2
    ) AS percentual_registros_mantidos;
