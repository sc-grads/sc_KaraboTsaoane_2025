class Car:
    def __init__(self , brand: str , wheels: str) -> None:
        self.brand = brand
        self.wheels = wheels
    def turn_on(self) ->None:
        print(f'Turning on:{self.brand}')


def main() -> None:
    bmw: Car = Car('BMW ' ,4)
    bmw.turn_on()

if __name__ == "--main--":
    main()