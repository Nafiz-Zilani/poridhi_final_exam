from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session

from app.database import Base, engine, get_db
from app import models, schemas, crud
from app.models import User
from app.schemas import UserCreate
from app.crud import create_user, get_users

Base.metadata.create_all(bind=engine)

# app = FastAPI(title="Users API")

# app.add_middleware(
#     CORSMiddleware,
#     allow_origins=["http://localhost:3000"],
#     allow_methods=["*"],
#     allow_headers=["*"],
#     allow_credentials=True
# )

app = FastAPI()

origins = [
    "http://localhost:3000",
    "http://127.0.0.1:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/users/", response_model=UserOut)
def create_user(user: UserCreate, db: Session = Depends(get_db)):
    if user.email:
        existing = crud.get_user_by_email(db, user.email)
        if existing:
            raise HTTPException(status_code=400, detail="Email already exists")

    return crud.create_user(db, user)

@app.get("/users/", response_model=list[UserOut])
def list_users(db: Session = Depends(get_db)):
    return crud.get_users(db)

@app.get("/users/{user_id}", response_model=UserOut)
def get_user(user_id: int, db: Session = Depends(get_db)):
    user = crud.get_user(db, user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user

@app.put("/users/{user_id}", response_model=UserOut)
def update_user(user_id: int, update: UserUpdate, db: Session = Depends(get_db)):
    db_user = crud.get_user(db, user_id)
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    return crud.update_user(db, db_user, update)

@app.delete("/users/{user_id}")
def delete_user(user_id: int, db: Session = Depends(get_db)):
    db_user = crud.get_user(db, user_id)
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    crud.delete_user(db, db_user)
    return {"message": "User deleted"}