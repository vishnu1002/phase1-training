from fastapi import FastAPI, Depends
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker, Session, declarative_base
from pydantic import BaseModel, ConfigDict
from typing import List
import uvicorn

# --- DB Setup ---
DB_URL = r"sqlite:///D:\database.db"
engine = create_engine(DB_URL, connect_args={"check_same_thread": False})
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()

class AlbumClass(Base):
    __tablename__ = 'album'
    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    title = Column(String(50), nullable=False)
    artist = Column(String(50), nullable=False)
    year = Column(Integer, nullable=False)
    duration = Column(Integer, nullable=False)

Base.metadata.create_all(bind=engine)

# --- Pydantic Schemas ---

class AlbumCreate(BaseModel):
    title: str
    artist: str
    year: int
    duration: int

class AlbumRead(BaseModel):
    id: int
    title: str
    artist: str
    year: int
    duration: int
    model_config = ConfigDict(from_attributes=True)

class AlbumDTO(BaseModel):
    title: str
    model_config = ConfigDict(from_attributes=True)

# --- FastAPI Setup ---

app = FastAPI()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.post("/add", response_model=AlbumRead)
def add_album(album_in: AlbumCreate, db: Session = Depends(get_db)):
    album = AlbumClass(
        title=album_in.title,
        artist=album_in.artist,
        year=album_in.year,
        duration=album_in.duration
    )
    db.add(album)
    db.commit()
    db.refresh(album)
    return album

@app.get("/all", response_model=List[AlbumRead])
def get_albums(db: Session = Depends(get_db)):
    return db.query(AlbumClass).all()

@app.get("/getBy/{id}", response_model=AlbumDTO)
def get_by(id: int, db: Session = Depends(get_db)):
    alb = db.query(AlbumClass).filter_by(Id=id).first()
    if not alb:
        return {"title": None}
    return alb

@app.middleware("http")
async def addmiddleware(request, call_next):
    print("middleware has intercepted the call")
    response = await call_next(request)
    return response

if __name__ == "__main__":
    uvicorn.run("app:app", host="127.0.0.1", port=8000, reload=True)
