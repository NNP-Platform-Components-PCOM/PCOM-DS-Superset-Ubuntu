# syntax=docker/dockerfile:1.7
#
# PCOM - DS - Superset
# --------------------
# Apache Superset 6.0.0 with additional database drivers and BI connectors
# for the NNP Data Suite components.

FROM apache/superset:6.0.0

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION="6.0.0"

LABEL org.opencontainers.image.title="pcom-ds-superset-ubuntu" \
      org.opencontainers.image.description="Apache Superset 6.0.0 with PostgreSQL, MySQL, MSSQL, StarRocks, ClickHouse, Hive, Trino, DuckDB, Elasticsearch, and analytics connectors." \
      org.opencontainers.image.vendor="Nubo Native Platform" \
      org.opencontainers.image.source="https://github.com/NNP-Platform-Components-PCOM/PCOM-DS-Superset-Ubuntu" \
      org.opencontainers.image.url="https://github.com/NNP-Platform-Components-PCOM/PCOM-DS-Superset-Ubuntu" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${VCS_REF}" \
      org.opencontainers.image.created="${BUILD_DATE}"

USER root

ENV UV_CACHE_DIR=/tmp/uv-cache

RUN apt-get update && apt-get install -y --no-install-recommends \
    pkg-config \
    build-essential \
    default-libmysqlclient-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/uv-cache && \
    chown -R superset:superset /tmp/uv-cache /app/.venv

USER superset

RUN . /app/.venv/bin/activate && \
    uv pip install \
        psycopg2-binary \
        mysqlclient \
        pymssql \
        starrocks \
        clickhouse-connect \
        pyhive \
        trino \
        duckdb-engine \
        elasticsearch-dbapi \
        Authlib \
        openpyxl \
        Pillow \
        redis \
        pyarrow \
        prophet

CMD ["/app/docker/entrypoints/run-server.sh"]
