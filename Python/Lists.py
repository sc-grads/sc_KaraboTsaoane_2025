people : list[str] = ['Bob' , 'James' , 'Tom']
print(people)
print(people[0]) #Accessing an element via its position

people.append('Jeremy') #adds an element to the list
print(people)

people.remove('Bob') # removes element from list
print(people)

people.pop() #removes last element in the list
print(people)

people[0] = 'Charlotte' #Assigning a new value to this position
print(people)

people.insert(1 , 'Timothy') #Inserting a new value by specifying where you want it and what the value is
print(people)

people.clear() # Clears list to be empty
print(people)