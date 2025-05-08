def greet():   #defining function and its name
    print('Hello')
    print('-----')

greet()   #Is more like calling the function

from datetime import datetime
def show_time():
    now: datetime = datetime.now()
    print(f'Time:{now:%H:%M:%S}')

show_time()