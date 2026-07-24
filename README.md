# nyc-taxi-data-analysis
Analisei 3,8 milhões de corridas de táxi utilizando PostgreSQL e SQL para identificar padrões de demanda, comportamento financeiro e problemas de qualidade nos dados.
## Tecnologias:

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)


## Principais conceitos:
Data Cleaning · EDA · CTEs · JOINs · Window Functions · Aggregations · Business Intelligence


## 📌 Sobre o Projeto

Este projeto tem como objetivo analisar dados de corridas de táxi de Nova York, explorando aspectos **operacionais e financeiros** do serviço.

A análise foi desenvolvida utilizando **PostgreSQL** como principal ferramenta de análise, permitindo a aplicação de consultas SQL sobre uma base com aproximadamente **3,8 milhões de registros**.

O projeto busca responder perguntas de negócio como:

* Quais períodos apresentam maior demanda por corridas?
* Quais zonas concentram o maior volume de viagens?
* Quais zonas apresentam maior receita?
* Qual é o valor médio das corridas?
* Como a receita varia ao longo do tempo?
* Qual é a relação entre a distância percorrida e o valor da corrida?
* Quais padrões ou anomalias podem ser identificados nos dados?
* Como a qualidade dos dados pode impactar os resultados das análises?

A partir dessas análises, o projeto busca transformar dados brutos em **insights relevantes para a compreensão do comportamento das corridas, da demanda e da geração de receita**, utilizando SQL e técnicas de análise exploratória de dados.



## 🗂️ Dataset

O projeto utiliza dados de corridas de táxi de Nova York referentes ao período de **abril de 2026**.

A base de dados contém:

* **3.831.240 registros**
* **20 variáveis originais**

### Principais campos

| Campo                   | Descrição                            |
| ----------------------- | ------------------------------------ |
| `VendorID`              | Identificador do provedor do serviço |
| `tpep_pickup_datetime`  | Data e hora de início da corrida     |
| `tpep_dropoff_datetime` | Data e hora de término da corrida    |
| `passenger_count`       | Quantidade de passageiros            |
| `trip_distance`         | Distância percorrida na corrida      |
| `PULocationID`          | Identificador da zona de embarque    |
| `DOLocationID`          | Identificador da zona de desembarque |
| `payment_type`          | Tipo de pagamento utilizado          |
| `fare_amount`           | Valor da tarifa da corrida           |
| `tip_amount`            | Valor da gorjeta                     |
| `tolls_amount`          | Valor pago em pedágios               |
| `total_amount`          | Valor total da corrida               |


## 🛠️ Tecnologias Utilizadas

### PostgreSQL

Utilizado como principal ambiente de armazenamento, análise e consulta dos dados.

### SQL

Utilizado para:

* Exploração e análise dos dados
* Agregações
* Análise da qualidade dos dados
* Criação de métricas e indicadores
* CTEs (Common Table Expressions)
* `CASE WHEN`
* `JOINs`
* Window Functions
* Análise temporal

### Python

Utilizado principalmente para:

* Leitura do arquivo Parquet
* Processamento e carregamento dos dados
* Integração com o PostgreSQL

**Principais bibliotecas:**

* Pandas
* SQLAlchemy
* psycopg2

### Power BI

Utilizado para a construção da camada de visualização e apresentação dos principais indicadores e insights obtidos a partir das análises.


## 🔎 Etapas do Projeto

O projeto foi desenvolvido seguindo as seguintes etapas:

```text
Dataset Parquet
       ↓
Python + Pandas
       ↓
PostgreSQL
       ↓
Análise Exploratória de Dados (EDA)
       ↓
Análise da Qualidade dos Dados
       ↓
Análise e Consultas SQL
       ↓
CTEs, JOINs e Window Functions
       ↓
Criação de Métricas e Indicadores
       ↓
Insights de Negócio
       ↓
Power BI
       ↓
Dashboard
```

O fluxo contempla desde a **ingestão e preparação dos dados** até a **análise exploratória, aplicação de técnicas SQL e visualização dos resultados**, permitindo transformar dados brutos em insights relevantes para a tomada de decisão.



## 1️⃣ Carregamento dos Dados

Os dados utilizados no projeto foram originalmente disponibilizados em formato **`.parquet`**.

O carregamento inicial do arquivo foi realizado utilizando **Python** e a biblioteca **Pandas**:

```python
df = pd.read_parquet(arquivo)
```

Após a leitura e carregamento dos dados, o DataFrame foi enviado para o **PostgreSQL** utilizando **SQLAlchemy**:

```python
df.to_sql(
    "taxi_trips",
    engine,
    if_exists="replace",
    index=False,
    chunksize=10000
)
```

A tabela final criada no banco de dados foi denominada:

```text
taxi_trips
```

O uso de `chunksize=10000` permitiu realizar a inserção dos dados em lotes, facilitando o carregamento de uma base com aproximadamente **3,8 milhões de registros**.


## 2️⃣ Qualidade dos Dados

Durante a análise inicial da base, foram identificados alguns pontos que exigem atenção antes da utilização dos dados nas análises:

* **799.786 registros** com valores nulos em determinados campos;
* Aproximadamente **20,88% da base** afetada por esse padrão de ausência;
* Valores negativos em determinados campos financeiros;
* Distâncias de viagem extremamente elevadas;
* Corridas com duração igual a zero;
* Durações de viagem extremamente longas;
* Registros que exigem investigação antes de serem utilizados em análises específicas.

Um dos principais pontos identificados foi a **concentração dos valores ausentes em determinados campos**, indicando a necessidade de investigar se esses registros representam um padrão específico relacionado à origem dos dados ou se estão associados a problemas de qualidade.

> **Importante:** Os registros não são removidos automaticamente. A análise busca, primeiro, compreender a origem dos problemas identificados e avaliar seu impacto nas análises. A partir disso, são definidos critérios de tratamento adequados ao contexto dos dados e ao objetivo de cada análise.


## 3️⃣ Análises SQL

O projeto utiliza consultas SQL para explorar os dados e responder perguntas de negócio relacionadas à **demanda, receita, comportamento das corridas e desempenho ao longo do tempo**.

Um exemplo de análise realizada é o acompanhamento diário do volume de corridas e da receita gerada:

```sql
SELECT
    DATE(tpep_pickup_datetime) AS data,
    COUNT(*) AS quantidade_corridas,
    SUM(total_amount) AS receita_total
FROM taxi_trips
WHERE total_amount > 0
GROUP BY DATE(tpep_pickup_datetime)
ORDER BY data;
```

Essa análise permite acompanhar a **evolução diária do volume de corridas e da receita**, possibilitando identificar variações na demanda e no desempenho financeiro ao longo do período analisado.

---

## 4️⃣ Window Functions

As **Window Functions** são utilizadas para realizar análises comparativas e temporais sem a necessidade de agrupar ou perder o nível de detalhe dos registros analisados.

Um exemplo é a utilização da função `LAG()` para comparar a receita de cada dia com a receita do dia anterior:

```sql
LAG(receita_total) OVER (
    ORDER BY data
)
```

A partir dessa comparação, é possível calcular a **variação da receita ao longo do tempo**, identificando períodos de crescimento ou queda no desempenho.

Também são exploradas funções como:

* `LAG()` → comparação com períodos anteriores;
* `RANK()` → classificação dos resultados;
* `ROW_NUMBER()` → atribuição de uma sequência aos registros;
* `SUM() OVER()` → cálculo de totais acumulados;
* `AVG() OVER()` → cálculo de médias móveis ou médias por janela.

Essas técnicas permitem aprofundar a análise dos dados e gerar **insights comparativos e temporais** sobre o comportamento das corridas e da receita.

## 📈 Principais Indicadores

O projeto acompanha diferentes indicadores para analisar o desempenho **operacional, financeiro e a qualidade dos dados**.

### 🚕 Indicadores Operacionais

* Total de corridas
* Corridas por dia
* Corridas por hora
* Corridas por dia da semana
* Distância média percorrida
* Duração média das corridas
* Velocidade média

### 💰 Indicadores Financeiros

* Receita total
* Receita média por corrida
* Ticket médio
* Valor total de gorjetas
* Receita por zona
* Receita por período

### 🔎 Indicadores de Qualidade dos Dados

* Percentual de dados nulos
* Identificação de valores negativos
* Identificação de distâncias atípicas
* Identificação de durações inconsistentes
* Identificação de registros potencialmente anômalos

Esses indicadores são utilizados para avaliar o comportamento das corridas, compreender os padrões de demanda e receita e identificar possíveis problemas que possam impactar a confiabilidade das análises.


## Análise de consistência temporal

Foram identificados 12 registros com datas fora do período de referência da análise. Os registros foram investigados individualmente para avaliar se representam inconsistências de origem ou viagens iniciadas no final do período e concluídas posteriormente. A decisão de tratamento foi baseada no contexto de cada registro, evitando a remoção automática dos dados.
