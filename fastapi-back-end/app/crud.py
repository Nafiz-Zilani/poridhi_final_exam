from sqlalchemy.orm import Session
from . import models

def get_or_create_client(db: Session, phone: str, name=None):
    client = db.query(models.Client).filter_by(phone=phone).first()
    if not client:
        client = models.Client(phone=phone, name=name)
        db.add(client)
        db.commit()
        db.refresh(client)
    return client

def list_products(db: Session):
    return db.query(models.Product).all()

def get_product(db: Session, pid: int):
    return db.query(models.Product).filter_by(id=pid).first()

def create_purchase(db: Session, phone, items, receipt_path, total):
    purchase = models.Purchase(
        client_phone=phone,
        total_amount=total,
        receipt_path=receipt_path
    )
    db.add(purchase)
    db.commit()
    db.refresh(purchase)

    for it in items:
        db.add(models.PurchaseItem(
            purchase_id=purchase.id,
            product_id=it["product_id"],
            quantity=it["quantity"],
            unit_price=it["unit_price"],
        ))
    db.commit()
    return purchase
