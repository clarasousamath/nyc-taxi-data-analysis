# Análises Avançadas com CTEs, Window Functions e JOINs

## Objetivo

Esta etapa apresenta análises avançadas realizadas sobre o conjunto de dados **New York City Taxi Trips**, utilizando recursos SQL como **CTEs (Common Table Expressions)**, **Window Functions** e **JOINs**.

O objetivo foi transformar os dados brutos de corridas em indicadores capazes de apoiar decisões relacionadas à performance operacional, evolução da receita, comportamento temporal e distribuição geográfica da demanda.

As análises foram direcionadas para responder perguntas como:

* Quais períodos apresentaram melhor desempenho financeiro?
* Como a receita evoluiu ao longo do mês?
* Quais dias tiveram comportamento acima do esperado?
* Quais regiões possuem maior contribuição para a operação?
* Existe diferença entre volume de corridas e geração de receita?

---

# 1. Análise temporal da receita utilizando CTEs

## Objetivo

Avaliar o comportamento diário da operação durante abril de 2026, acompanhando a relação entre quantidade de corridas, receita gerada e ticket médio.

## Abordagem utilizada

Foi criada uma CTE para consolidar os indicadores diários a partir dos registros individuais de viagens.

A agregação permitiu transformar milhões de registros de corridas em uma visão temporal resumida, facilitando análises de tendência e comparação entre dias.

Indicadores calculados:

* quantidade de corridas;
* receita total diária;
* ticket médio por corrida.

## Principais resultados

A receita apresentou comportamento relativamente estável durante o mês, acompanhando principalmente a variação da quantidade de corridas.

Os maiores faturamentos diários ocorreram em:

| Data       |          Receita |
| ---------- | ---------------: |
| 25/04/2026 | US$ 4.678.720,44 |
| 23/04/2026 | US$ 4.543.947,95 |
| 16/04/2026 | US$ 4.513.999,91 |

O ticket médio permaneceu em uma faixa próxima durante todo o período, indicando que as variações de receita foram influenciadas principalmente pelo volume operacional.

## Insight de negócio

O crescimento da receita esteve relacionado principalmente ao aumento da demanda, e não a alterações significativas no valor médio das corridas.

Esse comportamento indica que estratégias voltadas para disponibilidade de veículos e atendimento de picos de demanda possuem potencial impacto direto no faturamento.

---

# 2. Identificação de dias acima da média utilizando CTEs

## Objetivo

Identificar quais dias apresentaram desempenho financeiro superior ao padrão médio do mês.

## Abordagem utilizada

Foram utilizadas duas CTEs:

1. Uma para calcular a receita diária.
2. Outra para calcular a receita média diária do período.

Após isso, foi realizada uma comparação entre cada dia e a média mensal utilizando `CROSS JOIN`.

## Resultado

A receita média diária calculada foi:

**US$ 3.845.282,97**

Os dias com maior desempenho foram:

| Data       |          Receita | Diferença em relação à média |
| ---------- | ---------------: | ---------------------------: |
| 25/04/2026 | US$ 4.678.720,44 |              +US$ 833.437,47 |
| 23/04/2026 | US$ 4.543.947,95 |              +US$ 698.664,98 |
| 16/04/2026 | US$ 4.513.999,91 |              +US$ 668.716,94 |

## Insight de negócio

Essa análise permite identificar períodos de alta performance que podem ser investigados para compreender fatores externos ou operacionais, como:

* eventos na cidade;
* condições climáticas;
* maior fluxo turístico;
* aumento da disponibilidade de motoristas.

---

# 3. Evolução da receita utilizando Window Functions

## Objetivo

Avaliar a variação diária da receita e identificar aumentos ou quedas relevantes entre dias consecutivos.

## Técnica utilizada

Foi aplicada a função de janela:

```sql
LAG()
```

Essa função permite acessar o valor da linha anterior sem necessidade de realizar JOIN da tabela com ela mesma.

A análise calculou:

* receita do dia;
* receita do dia anterior;
* variação absoluta entre períodos.

## Principais resultados

Maior crescimento diário:

**25/04/2026**

Variação:

**+US$ 514.668,43**

Maior queda diária:

**26/04/2026**

Variação:

**-US$ 1.137.137,81**

## Insight de negócio

A utilização de Window Functions permitiu identificar mudanças bruscas de comportamento operacional.

O crescimento expressivo no dia 25/04 seguido de uma forte redução no dia seguinte indica a necessidade de investigar possíveis eventos pontuais que influenciaram a demanda.

---

# 4. Receita acumulada utilizando Window Functions

## Objetivo

Demonstrar a evolução do faturamento ao longo do mês e acompanhar o crescimento acumulado da operação.

## Técnica utilizada

Foi utilizada uma Window Function com:

```sql
SUM() OVER()
```

permitindo calcular o acumulado progressivo sem necessidade de subconsultas complexas.

## Resultado

A receita acumulada ao final de abril de 2026 foi:

**US$ 115.358.489,23**

## Insight de negócio

O indicador acumulado é adequado para dashboards executivos, permitindo acompanhar o progresso financeiro durante o período e comparar o desempenho realizado com metas previamente estabelecidas.

---

# 5. Análise geográfica utilizando JOINs

## Objetivo

Relacionar os códigos de localização das corridas com informações descritivas das zonas de Nova York.

## Técnica utilizada

Foi realizado um `LEFT JOIN` entre:

* tabela de corridas (`taxi_trips`);
* tabela dimensional de zonas (`taxi_zones`).

Essa etapa transforma identificadores numéricos em informações interpretáveis, como:

* nome da zona;
* bairro;
* região administrativa.

---

# 6. Comparação entre demanda e receita por zona

## Objetivo

Avaliar se as regiões com maior quantidade de corridas também representam as maiores oportunidades financeiras.

## Principais resultados

### Zonas com maior receita

| Zona              |           Receita | Ticket Médio |
| ----------------- | ----------------: | -----------: |
| JFK Airport       | US$ 11.749.750,15 |    US$ 80,01 |
| LaGuardia Airport |  US$ 6.966.190,44 |    US$ 70,73 |
| Midtown Center    |  US$ 4.482.410,41 |    US$ 27,49 |

### Zonas com maior quantidade de corridas

| Zona                  | Corridas | Ticket Médio |
| --------------------- | -------: | -----------: |
| Upper East Side South |  182.427 |    US$ 22,04 |
| Midtown Center        |  163.061 |    US$ 27,49 |
| Upper East Side North |  161.452 |    US$ 22,65 |

## Principais insights

### 1. Volume não significa maior rentabilidade

As regiões com maior quantidade de viagens não são necessariamente as que geram maior receita.

O JFK Airport apresenta menos corridas que algumas regiões de Manhattan, porém gera receita significativamente superior devido ao ticket médio elevado.

---

### 2. Aeroportos possuem alto valor estratégico

JFK Airport e LaGuardia Airport possuem:

* menor volume relativo;
* maior valor médio por corrida.

Essas regiões representam oportunidades importantes para maximização de receita por viagem.

---

### 3. Manhattan concentra demanda operacional

As regiões centrais apresentam grande quantidade de viagens, indicando alta concentração de passageiros e necessidade de disponibilidade constante de veículos.

---

# Conclusão

A utilização conjunta de CTEs, Window Functions e JOINs permitiu evoluir da análise descritiva para uma análise exploratória orientada a decisões.

As CTEs foram utilizadas para organizar etapas intermediárias e facilitar análises complexas.

As Window Functions permitiram avaliar comportamento temporal, variações e acumulados sem operações custosas.

Os JOINs possibilitaram integrar informações geográficas, transformando códigos técnicos em análises de negócio.

Os principais aprendizados foram:

* a receita apresenta forte relação com volume de corridas;
* períodos de alta performance podem ser identificados através de comparações temporais;
* regiões com maior demanda não necessariamente possuem maior rentabilidade;
* aeroportos representam pontos estratégicos devido ao alto ticket médio.

Essas análises demonstram a aplicação prática de SQL avançado para geração de insights em operações de mobilidade urbana.
