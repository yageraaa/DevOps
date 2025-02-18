from fastapi import FastAPI, HTTPException

app = FastAPI()


@app.get("/add")
def add(a: float, b: float):
    return {"результат": a + b}


@app.get("/subtract")
def subtract(a: float, b: float):
    return {"результат": a - b}


@app.get("/multiply")
def multiply(a: float, b: float):
    return {"результат": a * b}


@app.get("/divide")
def divide(a: float, b: float):
    if b == 0:
        raise HTTPException(status_code=400, detail="Деление на ноль")
    return {"результат": a / b}
