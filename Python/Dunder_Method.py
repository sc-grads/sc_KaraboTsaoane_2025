from typing import Self

class Book:
    def __init__(self, title):
        self.title = title

    def __eq__(self, other):
        return self.title == other.title

b1 = Book("Python")
b2 = Book("Python")

print(b1 == b2)  # True, because titles match
