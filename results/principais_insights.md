# Principais Insights

## 1. Qualidade dos Dados

A primeira etapa do projeto concentrou-se em avaliar a confiabilidade do conjunto de dados antes de realizar análises operacionais e financeiras.

O objetivo era identificar valores ausentes, inconsistências temporais, valores extremos e registros inválidos que pudessem afetar a qualidade dos insights de negócios.

### Valores Ausentes

A análise identificou **799.786 registros (20,88% do conjunto de dados)** contendo valores ausentes nas seguintes variáveis:

- passenger_count
- RatecodeID
- store_and_fwd_flag
- congestion_surcharge
- Airport_fee

Uma investigação subsequente revelou que **100% desses registros pertencem a `payment_type = 0`**, indicando que os valores ausentes estão concentrados em um subconjunto específico do conjunto de dados, em vez de estarem distribuídos aleatoriamente.

### Consistência Temporal

O conjunto de dados contém registros fora do período de análise esperado.
Embora o projeto foque em corridas de táxi a partir de abril de 2026, foram identificados registros datados de **1º de janeiro de 2001**.
Essas observações indicam a presença de inconsistências temporais que devem ser consideradas ao realizar análises baseadas no tempo.

### Valores Atípicos de Distância

Foram identificados valores extremos na variável `trip_distance`.
A distância máxima registrada atingiu **281.576,08**, valor consideravelmente acima dos padrões operacionais esperados para corridas de táxi.
Essas observações sugerem a presença de valores atípicos (*outliers*) que podem distorcer medidas estatísticas, como a distância média e a velocidade média.


### Valores Financeiros Negativos

A validação financeira identificou valores negativos em variáveis ​​relacionadas à tarifa.
Embora esses registros representem uma pequena parcela do conjunto de dados, eles requerem investigação adicional antes de serem incorporados a indicadores financeiros, como a receita total e a tarifa média.

### Duração da Viagem

A análise identificou **12 viagens com duração superior a 180 minutos**, ultrapassando o limite definido para este projeto.
Esses registros foram classificados como potenciais *outliers* de duração e devem ser avaliados antes do cálculo de indicadores operacionais, como a duração média da viagem e a velocidade média.

## Impacto nos Negócios

Os problemas identificados podem influenciar as análises operacionais e financeiras.
Valores ausentes concentrados em uma categoria de pagamento específica sugerem que parte do conjunto de dados segue um padrão de registro diferente.
Distâncias extremas e viagens excepcionalmente longas podem inflar as estatísticas agregadas, levando a estimativas enviesadas da distância média da viagem, do tempo de deslocamento e dos indicadores relacionados à receita.
Portanto, a validação da qualidade dos dados foi concluída antes de prosseguir para a análise de negócios.


## Decisão

O conjunto de dados original foi preservado.
Em vez de remover registros na etapa inicial, os problemas de qualidade dos dados foram documentados e avaliados individualmente.
Sempre que necessário, filtros analíticos são aplicados de acordo com o objetivo de cada análise, garantindo a reprodutibilidade e preservando o conjunto de dados original.

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
