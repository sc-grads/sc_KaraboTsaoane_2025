student = {"name": "Rolf", "grades": (89, 90, 93, 78, 90)}


def average(sequence):
    return sum(sequence) / len(sequence)


print(average(student["grades"]))

# But wouldn't it be nice if we could...
# print(student.average()) ?


class Student:                  #Just going to describe how a student behaves
    def __init__(self):         #Self is just a variable (When a function is inside a class is called a method)
        self.name = "Rolf"      #Is accessing the name inside self
        self.grades = (89, 90, 93, 78, 90)

    def average(self):
        return sum(self.grades) / len(self.grades)


student = Student()
print(student.average())
# Identical to Student.average(student)


# -- Parameters in __init__ --


class Student:
    def __init__(self, name, grades):
        self.name = name
        self.grades = grades

    def average(self):
        return sum(self.grades) / len(self.grades)


student = Student("Bob", (36, 67, 90, 100, 100))
print(student.average())

# -- Remember *args ? --


class Student:
    def __init__(self, name, *grades):
        self.name = name
        self.grades = grades

    def average(self):
        return sum(self.grades) / len(self.grades)


student = Student("Bob", 36, 67, 90, 100, 100)
print(student.average())