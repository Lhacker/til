class MyClass:
    """A simple example class"""
    def __init__(self):
        self.i = 12345

    def f(self):
        return 'hello world'

x = MyClass()

print(x.i)
print(x.f())

y = MyClass()
y.i = 54321
print(x.i)
