def add(x, y):
    print(x + y)


add(5, 8)
result = add(5, 8)
print(result) # 13


def add(x, y):
    return x + y


add(1, 2)  # Nothing printed out anymore.
result = add(2, 3)
print(result)  # 5

