from sqlalchemy import Column, String, Integer, DateTime, ForeignKey, func
from sqlalchemy.orm import relationship
from .database import Base

class Client(Base):
    __tablename__ = "clients"
    phone = Column(String(20), primary_key=True)
    name = Column(String(100))
    created_at = Column(DateTime, server_default=func.now())

class Product(Base):
    __tablename__ = "products"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    price = Column(Integer, nullable=False)
    stock = Column(Integer, default=0)

class Purchase(Base):
    __tablename__ = "purchases"
    id = Column(Integer, primary_key=True)
    client_phone = Column(String(20), ForeignKey("clients.phone"))
    created_at = Column(DateTime, server_default=func.now())
    total_amount = Column(Integer, nullable=False)
    receipt_path = Column(String(255))

class PurchaseItem(Base):
    __tablename__ = "purchase_items"
    id = Column(Integer, primary_key=True)
    purchase_id = Column(Integer, ForeignKey("purchases.id"))
    product_id = Column(Integer, ForeignKey("products.id"))
    quantity = Column(Integer, nullable=False)
    unit_price = Column(Integer, nullable=False)
