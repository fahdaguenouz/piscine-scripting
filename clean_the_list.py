def clean_list(items):
    if not items:
        return []

    res = []
    for item in items:
        res.append(item.strip())

    if not any(x == 'milk' for x in res):
        res.append('milk')

    result = []
    for i, item in enumerate(res, start=1):
        result.append(f'{i}/ {item.capitalize()}')
    return result