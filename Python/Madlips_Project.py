name: str = input('Enter name: ')
noun_a: str = input('Enter noun: ')
verb_a: str = input('Enter verb: ')
noun_b: str = input('Enter noun: ')
verb_b: str = input('Enter verb (past tense: ')
number_a: str = input('Enter number: ')
number_b: str = input('Enter another number: ')


story: str = f"""
"--------------------------------"
This is a story about {name} , a strong (and beautiful) {noun_a} who loved to {verb_a}.
-------------
"""
print(story)