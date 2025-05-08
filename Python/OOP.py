class Dog:
    def __init__(self, breed):
        self.breed = breed  # instance attribute

d1 = Dog("Labrador")
d2 = Dog("Beagle")

print(d1.breed)  # Labrador
print(d2.breed)  # Beagle
