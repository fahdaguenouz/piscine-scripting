import json
import os


def search_keys(data, result):
    if isinstance(data, dict):
        for key, value in data.items():
            if key == "password":
                result["password"] = value
            elif key == "secret":
                result["secret"] = value
            search_keys(value, result)

    elif isinstance(data, list):
        for item in data:
            search_keys(item, result)


def credentials_search():
    if not os.path.exists("logs.json"):
        return

    try:
        with open("logs.json", "r") as file:
            data = json.load(file)
    except (json.JSONDecodeError, FileNotFoundError):
        return

    result = {}
    search_keys(data, result)

    if result:
        with open("credentials.json", "w") as file:
            json.dump(result, file, indent=2)