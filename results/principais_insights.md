# Principais Insights

## 1. Qualidade dos Dados

### Registros com valores ausentes

Foram identificados 799.786 registros com valores ausentes em determinados campos, representando aproximadamente 20,88% da base.
A análise por `payment_type` revelou que todos esses registros estão concentrados em `payment_type = 0`. Nesses registros, os
campos `passenger_count`, `RatecodeID`, `store_and_fwd_flag`, `congestion_surcharge` e `Airport_fee` apresentam valores nulos.
Os registros não foram removidos automaticamente. O impacto desse grupo será considerado de acordo com o objetivo de cada análise.

### Inconsistência temporal

A análise identificou registros com datas anteriores ao período esperado de abril de 2026. A primeira data encontrada foi `2001-01-01`.
Como o projeto utiliza dados referentes a abril de 2026, esses registros foram identificados como inconsistências temporais e passaram a ser considerados nas etapas de validação da qualidade dos dados.

### Distâncias atípicas

Foram identificados valores extremos na variável `trip_distance`, com valor máximo de 281.576,08 km.
Esse resultado indica a presença de registros potencialmente inconsistentes ou atípicos que podem impactar análises relacionadas à distância média e ao desempenho operacional das corridas.
Por esse motivo, análises específicas de distância devem considerar critérios de validação e tratamento de valores extremos.

### Duração das corridas

A análise da duração das corridas identificou 12 registros com duração superior a 180 minutos, considerados outliers segundo o critério definido para o projeto.
Esses registros foram identificados durante a etapa de diagnóstico e devem ser avaliados antes de serem utilizados em métricas como duração média das corridas e velocidade média.

---

## 2. Demanda

[Preencher após concluir as análises operacionais]

---

## 3. Receita

[Preencher após concluir as análises financeiras]

---

## 4. Análise Temporal

[Preencher após concluir as Window Functions]

---

## 5. Análise Geográfica

[Preencher após concluir os JOINs com a tabela de zonas]
