import sqlite3

DB_PATH = r"D:\class\python\demo\database.db"
with sqlite3.connect(DB_PATH) as conn:
    cur = conn.cursor()
    cur.execute("SELECT name FROM sqlite_master WHERE type='table' AND name='user'")
    if not cur.fetchone():
        raise RuntimeError("ERROR: 'user' table does not exist in " + DB_PATH)
