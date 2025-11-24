from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
import os

# Use environment variable or fallback
DATABASE_URL = os.getenv(
    "DATABASE_URL",
    "mysql+pymysql://users_user:users_pass@localhost:3306/users_db"
)

# Create SQLAlchemy engine
engine = create_engine(
    DATABASE_URL,
    echo=False,
    pool_pre_ping=True,
    future=True  # modern SQLAlchemy
)

# SessionLocal class
SessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine
)

# Base class for models
Base = declarative_base()


# Dependency for FastAPI
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()