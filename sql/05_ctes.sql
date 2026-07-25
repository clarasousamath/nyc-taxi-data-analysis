-- ==========================================
-- 05 - CTEs
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- Receita e corridas por dia

WITH indicadores_diarios AS (

    SELECT
        DATE(tpep_pickup_datetime) AS data,
        COUNT(*) AS quantidade_corridas,
        SUM(total_amount) AS receita_total,
        AVG(total_amount) AS ticket_medio

    FROM taxi_trips

    WHERE
        total_amount > 0
        AND tpep_pickup_datetime >= '2026-04-01'
        AND tpep_pickup_datetime < '2026-05-01'

    GROUP BY DATE(tpep_pickup_datetime)

)

SELECT
    data,
    quantidade_corridas,
    ROUND(receita_total::numeric, 2)
        AS receita_total,
    ROUND(ticket_medio::numeric, 2)
        AS ticket_medio

FROM indicadores_diarios

ORDER BY data;


-- Identificar dias com receita acima da média diária

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

),

media_receita AS (

    SELECT
        AVG(receita_total) AS media_diaria

    FROM receita_diaria

)

SELECT
    r.data,
    ROUND(r.receita_total::numeric, 2)
        AS receita_total,
    ROUND(m.media_diaria::numeric, 2)
        AS media_receita_diaria

FROM receita_diaria r

CROSS JOIN media_receita m

WHERE r.receita_total > m.media_diaria

ORDER BY r.receita_total DESC;
