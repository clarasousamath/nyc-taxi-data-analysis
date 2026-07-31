# 2. Demanda

## Objetivo

A análise da demanda teve como objetivo compreender o comportamento operacional das corridas de táxi ao longo do período analisado, identificando padrões relacionados ao volume de viagens, horários de maior movimento, distribuição semanal e concentração geográfica das corridas.

Esses indicadores permitem entender como a demanda varia ao longo do tempo e quais regiões apresentam maior concentração de embarques.

---

## Relação com a Qualidade dos Dados

Os resultados desta seção foram interpretados considerando as conclusões obtidas durante a etapa de qualidade dos dados.

Os indicadores baseados em contagem de registros, como número de corridas por dia, distribuição por hora, dias da semana, zonas de embarque e rotas mais utilizadas, utilizam a base completa, uma vez que os valores extremos identificados anteriormente não alteram significativamente essas métricas.

Por outro lado, indicadores baseados em médias, como distância média e duração média das viagens, podem ser influenciados pelos valores extremos identificados na etapa de validação dos dados. Dessa forma, esses resultados são apresentados como uma visão geral do comportamento da base e devem ser interpretados considerando a existência desses registros atípicos.

---

## Principais Resultados

### Volume diário de corridas

Durante o mês de abril de 2026 foram registradas aproximadamente **3,8 milhões de corridas**, com uma média próxima de **127 mil viagens por dia**.

O maior volume ocorreu em **25 de abril**, com **161.081 corridas**, enquanto o menor foi registrado em **6 de abril**, com **99.708 corridas**.

Esses resultados demonstram que a demanda apresentou variações ao longo do período analisado, indicando que o volume de viagens não permaneceu constante entre os dias do mês.

---

### Distribuição das corridas por hora

A análise horária mostrou que o volume de viagens cresce gradualmente ao longo da manhã, atingindo seu maior nível entre **17h e 18h**, quando foram registradas aproximadamente **260 mil corridas**.

Os menores volumes foram observados durante a madrugada, especialmente entre **3h e 5h**.

Embora a base não contenha informações sobre o motivo das viagens, os resultados indicam um padrão consistente de concentração da demanda no final da tarde e início da noite.

---

### Distribuição por dia da semana

Foram observadas diferenças no volume de corridas entre os dias da semana.

As maiores quantidades de viagens ocorreram nas **quartas-feiras** e **quintas-feiras**, enquanto as **segundas-feiras** apresentaram o menor volume de corridas durante o período analisado.

Esses resultados evidenciam que a demanda varia ao longo da semana, indicando padrões operacionais distintos entre os dias analisados.

---

### Distância média das viagens

A distância média das corridas foi de **5,31 km**.

Esse resultado indica que a maior parte das viagens corresponde a deslocamentos urbanos de curta distância.

Entretanto, durante a etapa de qualidade dos dados foram identificados valores extremos para a variável `trip_distance`, motivo pelo qual essa métrica deve ser interpretada considerando a possível influência desses registros sobre a média.

---

### Duração média das viagens

A duração média observada foi de **18,25 minutos**.

Em conjunto com a distância média, esse indicador sugere predominância de viagens relativamente curtas dentro da área urbana.

Contudo, a etapa de qualidade dos dados identificou **12 viagens com duração superior a 180 minutos**, classificadas como potenciais outliers. Dessa forma, a duração média apresentada representa o comportamento geral da base, mas pode sofrer influência desses registros extremos.

---

### Principais zonas de embarque

As maiores concentrações de embarque foram observadas nas zonas **237**-"Upper East Side South", **161**-"Midtown Center", **236**-"Upper East Side North" e **132**-"JFK Airport", indicando que um número reduzido de localidades concentra parcela significativa da demanda.

Na etapa de análise geográfica essas zonas serão relacionadas aos respectivos bairros por meio da tabela oficial de localidades de Nova York, permitindo uma interpretação espacial mais detalhada dos resultados.

---

### Rotas mais utilizadas

As rotas com maior frequência concentram-se principalmente entre as zonas **237**-"Upper East Side South", **236**-"Upper East Side North", **161**-"Midtown Center" e **239**-"Upper West Side South", indicando elevada movimentação entre essas regiões.

Esses resultados sugerem a existência de corredores de deslocamento com elevada recorrência, que serão analisados em maior profundidade na etapa de análise geográfica.

---

## Impacto para o Negócio

A análise operacional evidencia que a demanda por corridas apresenta padrões temporais e espaciais bem definidos.

A identificação dos períodos de maior movimento pode contribuir para estratégias de planejamento operacional, dimensionamento da oferta de veículos e distribuição de recursos.

Da mesma forma, a concentração da demanda em determinadas zonas permite identificar regiões estratégicas para a operação do serviço e direcionar análises mais detalhadas sobre receita e desempenho geográfico.

---

## Conclusão

A análise da demanda mostrou que o comportamento das corridas não ocorre de maneira uniforme ao longo do período analisado.

Foram identificadas variações no volume diário de viagens, concentração da demanda em determinados horários, diferenças entre os dias da semana e forte concentração operacional em um conjunto reduzido de zonas de embarque.

Esses resultados estabelecem a base para as próximas etapas do projeto, nas quais serão investigados os aspectos financeiros, temporais e geográficos das corridas, permitindo compreender como os padrões operacionais influenciam a geração de receita e o desempenho do sistema.
