names: list[str] = ["Mario" ,"James" , "John"]
j_names: list[str] = []

for name in names:
    if name.startswith('J'):
        j_names.append(name)
#This just simplifies the above code but it is the same thing
j_names_lc: list[str] = [name for name in names if name.startswith('J')]
print(j_names_lc)