import json

def merge_two(first_dict):
    second_dict = {}

    while True:
        print("Add a new entry:")
        key = input("key: ")

        if key == "exit":
            break

        value = int(input("value: "))
        second_dict[key] = value

    merged = first_dict.copy()
    merged.update(second_dict)

    return json.dumps(merged)