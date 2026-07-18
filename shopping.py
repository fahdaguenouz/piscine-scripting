def remember_the_apple(list):
    if not list:
        return list
    if 'apple' not in list:
        list.append('apple')
    return list