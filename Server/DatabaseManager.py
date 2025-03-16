import sqlite3
from models import User

class DatabaseManager():

    def init_db(self):
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
                birthYear TEXT NOT NULL
            )
        ''')
        conn.commit()
        conn.close()

    def save_user(self, user):
        conn = sqlite3.connect('users.db')
        cursor = conn.cursor()
        cursor.execute('INSERT INTO users (id, gender, education, race, profession, birthYear) VALUES (?, ?, ?, ?, ?, ?)', 
                       (str(user.id), user.gender, user.education, user.race, user.profession, user.birthdate))
        conn.commit()
        conn.close()

    def get_all_users(self) -> list[User]:
        conn = sqlite3.connect('users.db')
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM users')
        rows = cursor.fetchall()
        conn.close()

        # Convert the result to a list of dictionaries
        return [{
            "id": row[0], 
            "gender": row[1],
            "education": row[2],
            "birthdate": row[3],
            "race": row[4],
            "profession": row[5],
            } for row in rows]