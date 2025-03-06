count = 0
sum = 0
print("before" , count , sum)
for value in [9 , 30 , 29 , 3]:
    count = count + 1
    sum = sum + value
    print(count , sum , value)
print ("After ", count , sum )
print ("Average" ,sum /count)
