FROM python:3.7.6-alpine3.11 as base

ENV PYTHONFAULTHANDLER=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DEFAULT_TIMEOUT=100 \
    PYTHONHASHSEED=random \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install fastapi uvicorn
COPY simple_file_server/ ./simple_file_server/
CMD ["uvicorn", "--host=0.0.0.0", "--port=80", "simple_file_server.server:app"]