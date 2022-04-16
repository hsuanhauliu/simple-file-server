# Simple File Server

A simple static file server written in Python. Docker is used here to bind folder as read-only, and it also gives us the flexibility to change port and folder to serve.


## Usage

Docker

```bash
docker build -t simple_file_server:latest .
docker run --mount type=bind,source="$(pwd)"/static,target=/app/static -p 8080:80 --name simple_file_server simple_file_server:latest
```

Your files will be served under: http://localhost:8080/static/ (e.g. `http://localhost:8080/static/test.log`).

Python

```bash
poetry install
poetry run uvicorn simple_file_server.server:app --host=0.0.0.0 --port=8080
```