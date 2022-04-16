from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

app = FastAPI(docs_url=None, redoc_url=None)
app.mount("/static", StaticFiles(directory="static"), name="static")
