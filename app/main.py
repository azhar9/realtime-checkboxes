from typing import Union
from fastapi.staticfiles import StaticFiles
from fastapi import FastAPI

app = FastAPI()

app.mount("/", StaticFiles(directory="ui"), name="ui")

@app.get("/")
def home():
    return "Welcome to the FastAPI application!"
