from pydantic import BaseModel, EmailStr
from datetime import date
from typing import Optional

# Base schema for common fields
class UserBase(BaseModel):
    first_name: str
    last_name: str
    date_of_birth: Optional[date] = None
    phone_no: Optional[str] = None
    email: Optional[EmailStr] = None
    address: Optional[str] = None

# Schema used when creating a new user
class UserCreate(UserBase):
    pass

# Schema used when updating an existing user
class UserUpdate(BaseModel):
    first_name: Optional[str] = None
    last_name: Optional[str] = None
    date_of_birth: Optional[date] = None
    phone_no: Optional[str] = None
    email: Optional[EmailStr] = None
    address: Optional[str] = None

# Schema used for responses
class UserOut(UserBase):
    id: int

    class Config:
        orm_mode = True
