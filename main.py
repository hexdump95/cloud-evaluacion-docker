from fastapi import FastAPI

app = FastAPI(docs_url=None, redoc_url=None)


@app.get("/")
async def get():
    return {
        "nombre": "Sergio",
        "apellido": "Villanueva",
        "legajo": 43884
    }
