from functools import reduce

items = [1, 2, 3]

print(":".join(map(lambda n: str(n), items)))

print(list(filter(lambda n: n < 3, items)))

print(reduce(lambda a, b: a + b, items))
