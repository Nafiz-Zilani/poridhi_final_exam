from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

# Read from ENV
DATABASE_URL = os.getenv("DATABASE_URL")

# Debug print to confirm value (important for Docker)
print("🔍 Loaded DATABASE_URL =", DATABASE_URL)

# Fail early if env is missing
if not DATABASE_URL:
    raise Exception(
        "❌ DATABASE_URL is missing! "
        "Docker does NOT read .env automatically. "
        "Run container with: docker run --env-file .env ..."
    )

# Create the SQLAlchemy engine
engine = create_engine(
    DATABASE_URL,
    echo=False,
    pool_pre_ping=True,
    future=True
)

# Create session maker
SessionLocal = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine
)

# Base class for ORM models
Base = declarative_base()


# Dependency for FastAPI routes
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
