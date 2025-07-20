FROM python:3.9.23-alpine3.22 AS base

ENV PYTHONFAULTHANDLER=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY simple_file_server/ ./simple_file_server/
COPY pyproject.toml .

RUN pip install .

CMD ["uvicorn", "--host=0.0.0.0", "--port=80", "simple_file_server.server:app"]
