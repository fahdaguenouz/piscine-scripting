import json


class User:
    username = "user"
    email = "something@mail.com"


def create_new_user(data):
    try:
        user_data = json.loads(data)

        if "username" in user_data and "email" in user_data:
            user = User()
            user.username = user_data["username"]
            user.email = user_data["email"]
            return user
    except:
        pass

    return User()


def user_to_json(user):
    return json.dumps(user.__dict__)