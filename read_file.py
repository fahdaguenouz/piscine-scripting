import json

def get_recipes(file_name):
    with open(file_name, "r") as file:
        recipes = json.load(file)
    return recipes