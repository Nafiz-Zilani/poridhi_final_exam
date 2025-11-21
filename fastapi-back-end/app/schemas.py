from pydantic import BaseModel
from typing import List, Optional

class ProductIn(BaseModel):
    id: int
    quantity: int

class PurchaseIn(BaseModel):
    phone: str
    name: Optional[str] = None
    items: List[ProductIn]

class ProductOut(BaseModel):
    id: int
    name: str
    price: int
    stock: int

    class Config:
        orm_mode = True
