class Person:
    count = 0

    def __init__(self):
        Person.count += 1

    @classmethod
    def get_count(cls):
        return cls.count

print(Person.get_count())  # 0
p1 = Person()
p2 = Person()
print(Person.get_count())  # 2