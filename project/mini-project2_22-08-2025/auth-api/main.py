from fastapi import FastAPI, Depends, HTTPException
from sqlalchemy.orm import Session
from db import Base, engine, SessionLocal
from models import User
from schemas import RegisterIn, VerifyIn, VerifyOut, UserOut
from security import hash_password, verify_password


app = FastAPI(title="Auth Service")
Base.metadata.create_all(bind=engine)


def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


# POST: /auth/register
@app.post("/auth/register")
def register(body: RegisterIn, db: Session = Depends(get_db)):
    # Check if username exists
    if db.query(User).filter(User.username == body.username).first():
        raise HTTPException(status_code=409, detail="username already exists")

    # Only run if username is new
    user = User(
        username=body.username,
        password_hash=hash_password(body.password),
        role=body.role
    )
    db.add(user)
    db.commit()
    db.refresh(user)

    return {"id": user.id, "username": user.username, "role": user.role}


# POST: /auth/verify
@app.post("/auth/verify", response_model=VerifyOut)
def verify(body: VerifyIn, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.username == body.username).first()
    if not user:
        return VerifyOut(valid=False, reason="not_found")
    if not verify_password(body.password, user.password_hash):
        return VerifyOut(valid=False, reason="bad_credentials")
    
    return VerifyOut(valid=True, role=user.role)


# GET: /users
@app.get("/users", response_model=list[UserOut])
def get_users(db: Session = Depends(get_db)):
    return db.query(User).all()


# GET: /users/{user_id}
@app.get("/users/{user_id}", response_model=UserOut)
def get_user(user_id: int, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user