
from flask import Flask, request, jsonify
from pydantic import ValidationError
from models import User
from databaseManager import DatabaseManager

app = Flask(__name__)

database_manager = DatabaseManager()

@app.route('/user', methods=['POST'])
def receive_user():
    try:
        user_data = request.get_json()
        user = User(**user_data)

        print(str(user.id), user.gender.value, user.education.value, user.race, user.profession, user.birthdate)

        database_manager.save_user(user)

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
        users = database_manager.get_all_users()

        # Respond with the list of users
        return jsonify({"users": users}), 200

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    database_manager.init_db()
    app.run(host='0.0.0.0', port=4001)
