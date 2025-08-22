from sqlalchemy import Column, Integer, String, DateTime, func
from db import Base


class User(Base):
  __tablename__ = "users"
  id = Column(Integer, primary_key=True, index=True)
  username = Column(String(64), unique=True, index=True, nullable=False)
  password_hash = Column(String(128), nullable=False)
  role = Column(String(16), nullable=False, default="user") # "admin" or "user"