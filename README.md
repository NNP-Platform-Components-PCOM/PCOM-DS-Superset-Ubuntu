# PCOM-DS-Superset-Ubuntu

Apache Superset 6.0.0 Docker image with a comprehensive set of database drivers and BI connectors, built for the Nubo Native Platform.

## Image

```
docker.io/nubonativesolution/pcom-ds-superset-ubuntu:6.0.0-v1
```

## Included Connectors

| Database | Driver |
|---|---|
| PostgreSQL | `psycopg2-binary` |
| MySQL | `mysqlclient` |
| SQL Server | `pymssql` |
| StarRocks | `starrocks` |
| ClickHouse | `clickhouse-connect` |
| Apache Hive / Spark | `pyhive` |
| Trino / Presto | `trino` |
| DuckDB | `duckdb-engine` |
| Elasticsearch | `elasticsearch-dbapi` |

## Additional Packages

| Package | Purpose |
|---|---|
| `Authlib` | OAuth / SSO authentication |
| `openpyxl` | Excel export |
| `Pillow` | Chart thumbnail generation |
| `redis` | Async query result cache |
| `pyarrow` | Columnar data performance |
| `prophet` | Time-series forecasting charts |

## Usage

```yaml
services:
  superset:
    image: docker.io/nubonativesolution/pcom-ds-superset-ubuntu:6.0.0-v1
    ports:
      - "8088:8088"
```

## CI/CD

Images are built and published to Docker Hub automatically on every push to `main` via the shared [PCOM-CICD](https://github.com/NNP-Platform-Components-PCOM/PCOM-CICD) pipeline.

| Tag | Description |
|---|---|
| `6.0.0-v1` | Superset 6.0.0, patch version 1 |
| `latest` | Most recent build |
