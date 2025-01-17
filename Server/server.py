import sqlite3
from flask import Flask, request, jsonify
from pydantic import BaseModel, ValidationError
from enum import Enum
import uuid

app = Flask(__name__)

class EducationBackground(str, Enum):
    BACHELOR = "bachelor"
    MASTER = "master"
    DOCTORATE = "doctorate"
    NONE = "none"
    HIGH_SCHOOL = "highschool"

class Gender(str, Enum):
    FEMALE = "female"
    MALE = "male"
    NONE = "none"
    OTHER = "other"

class User(BaseModel):
    id: uuid.UUID
    gender: Gender = Gender.NONE
    education: EducationBackground | None = None
    birthdate: str = ""
    race: str = ""
    profession: str = ""

def init_db():
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    cursor.execute('''
        DROP TABLE IF EXISTS users
    ''')
    cursor.execute('''
        CREATE TABLE users (
            id TEXT PRIMARY KEY,
            gender TEXT NOT NULL,
            education TEXT NOT NULL,
            race TEXT NOT NULL,
            profession TEXT NOT NULL,
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

        print(str(user.id), user.gender.value, user.education.value, user.race, user.profession, user.birthdate)

        conn = sqlite3.connect('users.db')
        cursor = conn.cursor()
        cursor.execute('INSERT INTO users (id, gender, education, race, profession, birthdate) VALUES (?, ?, ?, ?, ?, ?)', 
                       (str(user.id), user.gender.value, user.education.value, user.race, user.profession, user.birthdate))
        conn.commit()
        conn.close()

        response = {"message": "OK"}
        return jsonify(response), 200
    

    except ValidationError as e:
        return jsonify({"error": "Invalid user data", "details": e.errors()}), 400

    except Exception as e:
        print(str(e))
        return jsonify({"error": str(e)}), 500
    
@app.route('/users', methods=['GET'])
def get_all_users():
    try:
        conn = sqlite3.connect('users.db')
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users')
        rows = cursor.fetchall()
        conn.close()

        # Convert the result to a list of dictionaries
        users = [{
            "id": row[0], 
            "gender": row[1],
            "education": row[2],
            "birthdate": row[3],
            "race": row[4],
            "profession": row[5],
            } for row in rows]

        # Respond with the list of users
        return jsonify({"users": users}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=4001)
