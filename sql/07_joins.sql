-- ==========================================
-- 06 - JOINs
-- Projeto: NYC Taxi Data Analysis
-- ==========================================


-- 1. Análise de demanda por zona de embarque

SELECT
    z."Zone" AS zona_embarque,
    z."Borough" AS bairro,
    COUNT(*) AS quantidade_corridas

FROM taxi_trips t

LEFT JOIN taxi_zones z
    ON t."PULocationID" = z."LocationID"

GROUP BY
    z."Zone",
    z."Borough"

ORDER BY
    quantidade_corridas DESC;



-- 2. Análise de receita por zona

SELECT
    z."Zone" AS zona_embarque,
    z."Borough" AS bairro,
    COUNT(*) AS quantidade_corridas,
    ROUND(SUM(t.total_amount)::numeric, 2) AS receita_total,
    ROUND(AVG(t.total_amount)::numeric, 2) AS ticket_medio

FROM taxi_trips t

LEFT JOIN taxi_zones z
    ON t."PULocationID" = z."LocationID"

WHERE
    t.total_amount > 0

GROUP BY
    z."Zone",
    z."Borough"

ORDER BY
    receita_total DESC

LIMIT 10;



-- 3. Comparaçãocdemanda x receita:

SELECT
    z."Zone" AS zona_embarque,
    z."Borough" AS bairro,
    COUNT(*) AS quantidade_corridas,
    ROUND(SUM(t.total_amount)::numeric, 2) AS receita_total,
    ROUND(AVG(t.total_amount)::numeric, 2) AS ticket_medio

FROM taxi_trips t

LEFT JOIN taxi_zones z
    ON t."PULocationID" = z."LocationID"

WHERE
    t.total_amount > 0

GROUP BY
    z."Zone",
    z."Borough"

ORDER BY
    quantidade_corridas DESC

LIMIT 10;
