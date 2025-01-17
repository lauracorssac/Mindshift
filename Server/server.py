import sqlite3
from flask import Flask, request, jsonify
from pydantic import BaseModel, ValidationError

app = Flask(__name__)

class User(BaseModel):
    name: str
    birthdate: str

def init_db():
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            birthdate TEXT NOT NULL
        )
    ''')
    conn.commit()
    conn.close()

@app.route('/user', methods=['POST'])
def receive_user():
    try:
        user_data = request.get_json()
        user = User(**user_data)

        conn = sqlite3.connect('users.db')
        cursor = conn.cursor()
        cursor.execute('INSERT INTO users (name, birthdate) VALUES (?, ?)', (user.name, user.birthdate))
        conn.commit()
        conn.close()

        response = {"message": "OK"}
        return jsonify(response), 200
    

    except ValidationError as e:
        return jsonify({"error": "Invalid user data", "details": e.errors()}), 400

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    
@app.route('/users', methods=['GET'])
def get_all_users():
    try:
        conn = sqlite3.connect('users.db')
        cursor = conn.cursor()
        cursor.execute('SELECT name, birthdate FROM users')
        rows = cursor.fetchall()
        conn.close()

        # Convert the result to a list of dictionaries
        users = [{"name": row[0], "birthdate": row[1]} for row in rows]

        # Respond with the list of users
        return jsonify({"users": users}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=4001)
