-- ==========================================
-- 06 - Window Functions
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- Receita diária e comparação com o dia anterior

WITH receita_diaria AS (

    SELECT
        DATE(tpep_pickup_datetime) AS data,
        SUM(total_amount) AS receita_total

    FROM taxi_trips

    WHERE
        total_amount > 0
        AND tpep_pickup_datetime >= '2026-04-01'
        AND tpep_pickup_datetime < '2026-05-01'

    GROUP BY DATE(tpep_pickup_datetime)

)

SELECT
    data,

    ROUND(
        receita_total::numeric,
        2
    ) AS receita_total,

    ROUND(
        LAG(receita_total) OVER (
            ORDER BY data
        )::numeric,
        2
    ) AS receita_dia_anterior,

    ROUND(
        (
            receita_total
            - LAG(receita_total) OVER (
                ORDER BY data
            )
        )::numeric,
        2
    ) AS variacao_receita

FROM receita_diaria

ORDER BY data;





-- Ranking das zonas por receita

WITH receita_zona AS (

    SELECT
        "PULocationID" AS zona,
        SUM(total_amount) AS receita_total

    FROM taxi_trips

    WHERE total_amount > 0

    GROUP BY "PULocationID"

)

SELECT
    zona,

    ROUND(
        receita_total::numeric,
        2
    ) AS receita_total,

    RANK() OVER (
        ORDER BY receita_total DESC
    ) AS ranking_receita

FROM receita_zona

ORDER BY ranking_receita;





-- Receita acumulada ao longo do mês

WITH receita_diaria AS (

    SELECT
        DATE(tpep_pickup_datetime) AS data,
        SUM(total_amount) AS receita_total

    FROM taxi_trips

    WHERE
        total_amount > 0
        AND tpep_pickup_datetime >= '2026-04-01'
        AND tpep_pickup_datetime < '2026-05-01'

    GROUP BY DATE(tpep_pickup_datetime)

)

SELECT
    data,

    ROUND(
        receita_total::numeric,
        2
    ) AS receita_diaria,

    ROUND(
        SUM(receita_total) OVER (
            ORDER BY data
            ROWS BETWEEN UNBOUNDED PRECEDING
            AND CURRENT ROW
        )::numeric,
        2
    ) AS receita_acumulada

FROM receita_diaria

ORDER BY data;
