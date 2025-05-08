text: str = "Hello World"

for i in range(3):
    print(f'{i}: {text}')

names: list[str] = ['Bob' , 'James' , 'Maria']
for name in names:
    print(name)

for name in names:
    if len(name) > 4 :
        print(f'{name} has a long name')
    else:
        print(f'{name} has a short name')