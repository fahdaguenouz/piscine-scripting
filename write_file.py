def to_do(tasks):
    with open("output.txt", "w") as file:
        for date, task in tasks:
            formatted_date = date.strftime("%A %d %B %Y")
            file.write(f"{formatted_date}: {task}\n")