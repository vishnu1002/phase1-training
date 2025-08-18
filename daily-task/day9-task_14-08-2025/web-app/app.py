import os
import sqlite3
from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
DB_PATH = os.path.join(BASE_DIR, "database.db")

PASS = "admin"

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    error_message = None
    if request.method == 'POST':
        user = request.form['username']
        password = request.form['password']
        email = request.form['email']
        phone = request.form['phone']
        
        if password == PASS:
            with sqlite3.connect(DB_PATH) as conn:
                cur = conn.cursor()
                cur.execute("""
                    INSERT INTO user (username, pass, email, phone)
                    VALUES (?, ?, ?, ?)
                """, (user, password, email, phone))
                conn.commit()
            return redirect(url_for('dashboard', username=user))
        else:
            error_message = "Invalid password"

    return render_template('login.html', error=error_message)

@app.route('/dashboard/<username>')
def dashboard(username):
    with sqlite3.connect(DB_PATH) as conn:
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        cur.execute("SELECT username, email, phone, pass FROM user WHERE username = ?", (username,))
        user_data = cur.fetchone()

    if not user_data:
        return f"No data found for {username}", 404

    return render_template('dashboard.html', user=user_data)

@app.route('/dashboard/all')
def dashboard_all():
    with sqlite3.connect(DB_PATH) as conn:
        conn.row_factory = sqlite3.Row
        cur = conn.cursor()
        # Select everything except password
        cur.execute("SELECT username, email, phone FROM user")
        users = cur.fetchall()

    return render_template('dashboard_all.html', users=users)

if __name__ == '__main__':
    print("Using database:", DB_PATH)
    app.run(debug=True)
