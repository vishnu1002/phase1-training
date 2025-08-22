from pydantic import BaseModel, constr


class RegisterIn(BaseModel):
  username: constr(strip_whitespace=True, min_length=3, max_length=64)
  password: constr(min_length=6, max_length=128)
  role: constr(strip_whitespace=True, min_length=4, max_length=16) = "user"


class VerifyIn(BaseModel):
  username: str
  password: str


class VerifyOut(BaseModel):
  valid: bool
  role: str | None = None
  reason: str | None = None

class UserOut(BaseModel):
  id: int
  username: str
  role: str