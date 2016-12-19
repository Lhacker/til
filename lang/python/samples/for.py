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

for k, v in {'gallahad': 'the pure', 'robin': 'the brave'}.items():
    print(k, v, sep=': ')

for i, w in enumerate(words):
    print(i, w)
