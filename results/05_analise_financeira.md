# 05. Análise Financeira

## Objetivo

Esta etapa tem como objetivo avaliar o desempenho financeiro das corridas de táxi realizadas em Nova York durante o mês de abril de 2026. Foram analisados indicadores de receita, ticket médio, gorjetas, distribuição geográfica da arrecadação e formas de pagamento.

---

## Receita Total

A receita total obtida no período foi de **US$ 115.358.489,23**, representando o faturamento bruto das corridas registradas durante o mês de abril de 2026.

| Indicador | Valor |
|-----------|-------:|
| Receita Total | **US$ 115.358.489,23** |

---

## Ticket Médio

O ticket médio foi de **US$ 30,23**, indicando que cada corrida gerou, em média, aproximadamente trinta dólares de receita.

| Indicador | Valor |
|-----------|-------:|
| Ticket Médio | **US$ 30,23** |

Como a receita média por corrida utiliza a mesma métrica, ambos os indicadores apresentaram o mesmo valor.

---

## Total de Gorjetas

Durante o período analisado foram registradas **US$ 11.471.829,18** em gorjetas.

| Indicador | Valor |
|-----------|-------:|
| Total de Gorjetas | **US$ 11.471.829,18** |

Esse valor demonstra que as gorjetas representam uma parcela importante da remuneração dos motoristas.

---

## Receita por Dia

A receita diária acompanhou o comportamento observado na análise de demanda, apresentando crescimento nos dias de maior movimentação.

Os maiores faturamentos ocorreram em:

| Data | Receita |
|------|---------:|
| 25/04/2026 | US$ 4.678.720,44 |
| 23/04/2026 | US$ 4.543.947,95 |
| 16/04/2026 | US$ 4.513.999,91 |

Esse comportamento evidencia uma relação direta entre quantidade de corridas e receita gerada.

---

## Receita por Zona de Embarque

As zonas com maior faturamento foram:

| Posição | Zona | Receita |
|---------:|------|---------:|
| 1 | JFK Airport | US$ 11.749.750,15 |
| 2 | LaGuardia Airport | US$ 6.966.190,44 |
| 3 | Midtown Center | US$ 4.482.410,41 |
| 4 | Upper East Side South | US$ 4.020.819,71 |
| 5 | Upper East Side North | US$ 3.656.772,78 |
| 6 | Times Sq/Theatre District | US$ 3.435.140,37 |
| 7 | Penn Station/Madison Sq West | US$ 3.126.502,61 |
| 8 | Midtown East | US$ 3.078.207,28 |
| 9 | Lincoln Square East | US$ 2.671.312,12 |
| 10 | East Chelsea | US$ 2.588.743,61 |

Observa-se que os aeroportos **JFK Airport** e **LaGuardia Airport** lideram o faturamento, indicando que corridas originadas nesses locais possuem maior valor médio. As demais posições são ocupadas principalmente por regiões centrais de Manhattan, caracterizadas por elevado fluxo de passageiros.

---

## Receita por Tipo de Pagamento

Segundo a documentação oficial do conjunto de dados:

- **0** = Flex Fare
- **1** = Cartão de Crédito
- **2** = Dinheiro
- **3** = Sem cobrança (No charge)
- **4** = Disputa
- **5** = Desconhecido
- **6** = Corrida cancelada (Voided trip)

Os resultados obtidos foram:

| Tipo de pagamento | Quantidade | Receita | Ticket Médio |
|-------------------|-----------:|---------:|-------------:|
| Cartão de Crédito | 2.635.421 | US$ 79.640.072,55 | US$ 30,22 |
| Flex Fare | 799.701 | US$ 26.008.847,05 | US$ 32,52 |
| Dinheiro | 357.191 | US$ 9.133.665,01 | US$ 25,57 |
| Disputa | 13.491 | US$ 360.243,15 | US$ 26,70 |
| Sem cobrança | 10.031 | US$ 216.053,01 | US$ 21,54 |

### Principais observações

- O **cartão de crédito** é responsável pela maior parte da receita do sistema, representando a principal forma de pagamento utilizada pelos passageiros.
- As corridas classificadas como **Flex Fare** apresentaram o maior ticket médio entre as categorias analisadas.
- Os pagamentos em **dinheiro** possuem ticket médio inferior ao observado nas corridas pagas por cartão de crédito.
- Os tipos **Sem cobrança** e **Disputa** representam uma parcela muito pequena do faturamento total.

Observação: Os tipos Disputa (Dispute) e Sem cobrança (No Charge) seguem a classificação oficial do conjunto de dados da NYC TLC. Embora esses registros apresentem valores positivos na coluna total_amount, a documentação não detalha como esses valores são tratados financeiramente após uma contestação ou em corridas sem cobrança. Portanto, os valores são apresentados apenas como registros existentes na base de dados, sem inferir que representam receita efetivamente recebida.

---

## Relação com a Qualidade dos Dados

Na etapa de qualidade dos dados foram identificados registros com distâncias e durações extremamente elevadas. Entretanto, uma análise de sensibilidade mostrou que apenas **0,04%** dos registros foram classificados como outliers e que sua remoção provocou alterações inferiores a **0,1%** nos principais indicadores financeiros.

Dessa forma, optou-se por preservar a base de dados original, garantindo a integridade do conjunto de dados e a reprodutibilidade das análises.

---

## Conclusão

A análise financeira demonstra que o sistema de táxis movimentou mais de **US$ 115 milhões** durante o mês de abril de 2026.

Os aeroportos **JFK Airport** e **LaGuardia Airport** concentraram as maiores receitas, enquanto as regiões centrais de Manhattan apresentaram elevado volume financeiro devido à intensa demanda por corridas.

Além disso, verificou-se a predominância do **cartão de crédito** como principal forma de pagamento e a baixa influência dos outliers sobre os indicadores financeiros, reforçando a confiabilidade das análises realizadas.
