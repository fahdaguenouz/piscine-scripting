def clean_list(items):
    if not items:
        return []

    cleaned = list(items)
    if 'milk' not in cleaned:
        cleaned.append('milk')

    result = []
    for i, item in enumerate(cleaned, start=1):
        result.append(f'{i}/ {item.strip().capitalize()}')
    return result