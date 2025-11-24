from sqlalchemy import Column, Integer, String, Date
from app.database import Base  # Fix import to use app package

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    first_name = Column(String(100), nullable=False)
    last_name = Column(String(100), nullable=False)
    date_of_birth = Column(Date, nullable=True)
    phone_no = Column(String(50), nullable=True)
    email = Column(String(200), nullable=True, unique=True)
    address = Column(String(500), nullable=True)
