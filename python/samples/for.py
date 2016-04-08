words = ['cat', 'window', 'defenestrate']

for w in words[:]:
    print(w, len(w))

print()

for i in range(5):
    print(i)

print()

for i in range(2, 5):
    print(i)

print()

for i in range(2, 5, 2):
    print(i)

print()

for i, w in enumerate(words):
    print(i, w)
