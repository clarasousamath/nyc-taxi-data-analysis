

# 1. Qualidade dos Dados

## Objetivo

Antes da realização das análises operacionais e financeiras, foi conduzida uma etapa de avaliação da qualidade dos dados para verificar a confiabilidade da base e identificar possíveis problemas que pudessem comprometer os resultados das análises.

Foram investigados valores ausentes, inconsistências temporais, valores extremos e registros potencialmente inválidos.

---

## Principais Resultados

### Valores Ausentes

Foram identificados **799.786 registros**, representando aproximadamente **20,88% da base**, com valores ausentes nas variáveis:

- `passenger_count`
- `RatecodeID`
- `store_and_fwd_flag`
- `congestion_surcharge`
- `Airport_fee`

Foi observado que todas essas variáveis apresentam exatamente a mesma quantidade de registros ausentes, indicando que os valores nulos não ocorrem de forma aleatória.

A investigação mostrou que **100% desses registros pertencem ao grupo `payment_type = 0`**.

Além disso:

- os registros estão distribuídos durante todo o mês de abril de 2026;
- ocorrem ao longo das 24 horas do dia;
- pertencem aos Vendors 1, 2 e 6;
- representam aproximadamente **22,55% da receita total da base**, equivalente a mais de **R$ 26 milhões**.

Esses resultados indicam que os registros com valores ausentes fazem parte de um padrão consistente da base de dados e não de um erro isolado de importação.

---

### Consistência Temporal

Durante a validação foram identificados registros com datas anteriores ao período esperado de análise.

Embora o projeto utilize dados referentes ao mês de abril de 2026, foram encontrados registros datados de **1º de janeiro de 2001**, indicando inconsistências temporais que precisam ser consideradas nas análises baseadas em tempo.

---

### Valores Atípicos

Foram identificados registros com distâncias significativamente superiores ao esperado para corridas de táxi.

A maior distância registrada foi de **281.576,08**, caracterizando potenciais outliers capazes de distorcer indicadores como distância média, velocidade média e tempo médio de viagem.

Também foram identificadas **12 corridas com duração superior a 180 minutos**, classificadas como potenciais outliers operacionais.

---

### Valores Financeiros

A validação financeira identificou registros contendo valores negativos em variáveis monetárias.

Esses registros representam uma pequena parcela da base, porém foram mantidos para investigação durante as análises financeiras, evitando a exclusão prematura de informações potencialmente relevantes.

---

## Impacto para as Análises

A etapa de qualidade dos dados demonstrou que nem todo valor ausente representa um erro que deve ser removido.

Embora aproximadamente **20,88% dos registros apresentem informações ausentes**, esse grupo responde por aproximadamente **22,55% da receita total analisada**.

Esse resultado evidencia que a exclusão automática desses registros poderia introduzir vieses relevantes nos indicadores financeiros e operacionais.

Da mesma forma, a presença de distâncias extremas e durações atípicas pode alterar medidas estatísticas como médias e velocidades, justificando a aplicação de filtros específicos conforme o objetivo de cada análise.

---

## Decisão Analítica

O conjunto de dados original foi preservado.

Nenhum registro foi removido durante a etapa inicial de preparação dos dados.

Os problemas identificados foram documentados e avaliados individualmente, permitindo que cada análise utilizasse critérios específicos de tratamento conforme seu objetivo, preservando a rastreabilidade, a reprodutibilidade e a integridade da base original.
---
