class MyClass:
    """A simple example class"""
    def __init__(self):
        self.__i = 12345

    def f(self):
        return self.__f()

    def __f(self):
        return self.__i

x = MyClass()

#print(x.i)
print(x.f())
