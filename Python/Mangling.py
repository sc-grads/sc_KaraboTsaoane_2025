class Secret:
    def __init__(self):
        self.__password = "1234"

s = Secret()
# print(s.__password)        #  AttributeError
print(s._Secret__password)   #  1234 — name-mangled access