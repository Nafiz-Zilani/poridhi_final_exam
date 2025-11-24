import sys
import os
from logging.config import fileConfig

from sqlalchemy import engine_from_config, pool
from alembic import context

# --- Fix Python Path ---
current_dir = os.path.dirname(os.path.abspath(__file__))       # migrations/
project_root = os.path.abspath(os.path.join(current_dir, "..")) # fastapi-backend/
sys.path.append(project_root)

# --- Alembic Config ---
config = context.config

if config.config_file_name is not None:
    fileConfig(config.config_file_name)

# --- Import Base and Models ---
from app.database import Base
from app import models  # make sure Alembic detects models

# --- Target metadata ---
target_metadata = Base.metadata


def run_migrations_offline():
    url = config.get_main_option("sqlalchemy.url")
    context.configure(
        url=url,
        target_metadata=target_metadata,
        literal_binds=True,
        dialect_opts={"paramstyle": "named"},
    )

    with context.begin_transaction():
        context.run_migrations()


def run_migrations_online():
    configuration = config.get_section(config.config_ini_section)
    connectable = engine_from_config(
        configuration,
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )

    with connectable.connect() as connection:
        context.configure(
            connection=connection,
            target_metadata=target_metadata,
        )

        with context.begin_transaction():
            context.run_migrations()


if context.is_offline_mode():
    run_migrations_offline()
else:
    run_migrations_online()