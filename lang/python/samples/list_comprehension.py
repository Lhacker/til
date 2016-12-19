squares = [i**2 for i in range(1, 11)]
print(squares)
squares = [i**2 for i in range(11) if i > 0]
print(squares)
list = [(x, y) for x in range(2) for y in (range(3))]
print(list)

print()

matrix = [
    [1,2,3,4],
    [5,6,7,8],
    [9,10,11,12],
]
print([[row[i] for row in matrix] for i in range(4)])
