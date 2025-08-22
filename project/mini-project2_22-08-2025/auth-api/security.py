from passlib.context import CryptContext


pass_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


def hash_password(p: str) -> str:
  return pass_context.hash(p)


def verify_password(p: str, h: str) -> bool:
  return pass_context.verify(p, h)