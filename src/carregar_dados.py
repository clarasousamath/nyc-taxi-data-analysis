import pandas as pd
from sqlalchemy import create_engine

# Caminho do arquivo Parquet
arquivo = r"C:\Users\clara\OneDrive\Documentos\Portifólio\Projeto Business\Data\yellow_tripdata_2026-04 (1).parquet"

# Lê o arquivo Parquet
print("Lendo arquivo Parquet...")
df = pd.read_parquet(arquivo)

print(f"Arquivo carregado com sucesso!")
print(f"Quantidade de linhas: {len(df):,}")
print(f"Quantidade de colunas: {len(df.columns)}")

print("\nColunas encontradas:")
print(df.columns.tolist())

# Conexão com PostgreSQL
# ALTERE os dados abaixo conforme sua instalação
usuario = "postgres"
senha = "1234"
host = "localhost"
porta = "5432"
banco = "taxi_analysis"

# Cria conexão
engine = create_engine(
    f"postgresql+psycopg2://{usuario}:{senha}@{host}:{porta}/{banco}"
)

# Nome da tabela no PostgreSQL
nome_tabela = "taxi_trips"

print("\nEnviando dados para o PostgreSQL...")

df.to_sql(
    nome_tabela,
    engine,
    if_exists="replace",
    index=False,
    chunksize=10000
)

print("\nDados carregados com sucesso!")
print(f"Tabela criada: {nome_tabela}")
