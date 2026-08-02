# 04. Análise de Sensibilidade dos Outliers

## Objetivo

Na etapa de qualidade dos dados foram identificados registros com distâncias e durações atípicas (outliers). Antes de decidir removê-los da base, foi realizada uma análise de sensibilidade para verificar se esses registros alteravam significativamente os principais indicadores operacionais e financeiros do projeto.

Para essa análise foram considerados como outliers:

- Corridas com distância superior a **100 milhas**;
- Corridas com duração superior a **180 minutos**.

A base original foi preservada, sendo aplicados filtros apenas para comparação dos resultados.

---

## Quantidade de Registros Avaliados

| Métrica | Valor |
|---------|-------:|
| Registros originais | 3.831.240 |
| Registros após os filtros | 3.829.869 |
| Registros removidos | 1.371 |
| Percentual da base preservado | **99,96%** |

Apenas **0,04%** dos registros foram classificados como outliers, indicando que representam uma parcela muito pequena da base de dados.

---

## Comparação dos Indicadores

| Indicador | Base Original | Sem Outliers | Variação |
|-----------|--------------:|-------------:|----------:|
| Receita Total | US$ 115.358.489,23 | US$ 115.271.260,61 | -0,08% |
| Ticket Médio | US$ 30,23 | US$ 30,22 | -0,03% |
| Distância Média | 5,31 mi | 3,51 mi | -33,9% |
| Duração Média | 18,25 min | 17,73 min | -2,8% |

---

## Impacto nas Análises Financeiras

A remoção dos outliers provocou alterações mínimas nos indicadores financeiros.

A receita total apresentou redução de apenas **0,08%**, enquanto o ticket médio permaneceu praticamente inalterado. Esses resultados indicam que os registros extremos possuem influência insignificante sobre as análises de faturamento.

---

## Impacto nas Análises Operacionais

A distância média foi o indicador mais impactado, reduzindo de **5,31** para **3,51 milhas** (redução aproximada de **34%**). Esse comportamento demonstra que poucos registros com distâncias excepcionalmente elevadas eram suficientes para aumentar artificialmente essa média.

Já a duração média apresentou redução de apenas **2,8%**, indicando baixa influência dos outliers sobre esse indicador.

---

## Impacto no Ranking das Zonas de Maior Receita

A comparação entre os resultados antes e após a aplicação dos filtros mostrou que o ranking das zonas de embarque permaneceu exatamente o mesmo.

| Posição | Zona |
|---------:|------|
| 1 | JFK Airport |
| 2 | LaGuardia Airport |
| 3 | Midtown Center |
| 4 | Upper East Side South |
| 5 | Upper East Side North |
| 6 | Times Sq/Theatre District |
| 7 | Penn Station/Madison Sq West |
| 8 | Midtown East |
| 9 | Lincoln Square East |
| 10 | East Chelsea |

Embora os valores absolutos de receita tenham apresentado pequenas reduções, a ordem das regiões mais lucrativas permaneceu inalterada, reforçando que os outliers não alteram as conclusões de negócio.

---

## Conclusão

A análise de sensibilidade demonstrou que apenas **1.371 registros**, correspondentes a **0,04%** da base de dados, foram classificados como outliers.

Mesmo após sua remoção, os principais indicadores financeiros e operacionais permaneceram praticamente inalterados. A única diferença relevante ocorreu na distância média, evidenciando que essa métrica é naturalmente mais sensível à presença de valores extremos.

Dessa forma, optou-se por **preservar a base de dados original**, utilizando filtros apenas em análises específicas quando necessário. Essa abordagem mantém a integridade dos dados, garante a reprodutibilidade das análises e evita a exclusão desnecessária de registros potencialmente válidos.
