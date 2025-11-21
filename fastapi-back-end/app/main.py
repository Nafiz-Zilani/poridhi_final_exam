from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from fastapi.responses import FileResponse
from .database import SessionLocal, engine
from . import models, schemas, crud
from .utils import generate_receipt_pdf
import os

models.Base.metadata.create_all(bind=engine)

app = FastAPI()

origins = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
    "*"
]

# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=origins,
#     allow_credentials=True,
#     allow_methods=["*"],   # IMPORTANT (fixes OPTIONS blocking)
#     allow_headers=["*"],
# )

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],   # for testing
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/products", response_model=list[schemas.ProductOut])
def products(db: Session = Depends(get_db)):
    return crud.list_products(db)

@app.post("/purchase")
def purchase(payload: schemas.PurchaseIn, db: Session = Depends(get_db)):
    items_processed = []
    total = 0

    for it in payload.items:
        prod = crud.get_product(db, it.id)
        if not prod:
            raise HTTPException(404, f"Product {it.id} not found")
        if prod.stock < it.quantity:
            raise HTTPException(400, f"Not enough stock for {prod.name}")

        subtotal = prod.price * it.quantity
        items_processed.append({
            "product_id": prod.id,
            "name": prod.name,
            "quantity": it.quantity,
            "unit_price": prod.price,
            "subtotal": subtotal
        })
        total += subtotal
        prod.stock -= it.quantity

    db.commit()

    crud.get_or_create_client(db, payload.phone, payload.name)

    receipt_path = generate_receipt_pdf(payload.phone, items_processed, total)
    purchase = crud.create_purchase(
        db, payload.phone, items_processed, receipt_path, total
    )

    return {"purchase_id": purchase.id, "total": total, "receipt_path": receipt_path}

@app.get("/receipt/{filename}")
def get_receipt(filename: str):
    folder = os.getenv("PDF_FOLDER", "./receipts")
    path = os.path.join(folder, filename)
    if not os.path.exists(path):
        raise HTTPException(404, "Receipt not found")
    return FileResponse(path, media_type="application/pdf")
