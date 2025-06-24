name = "Bob"
greeting = "Hello, Bob"

print(greeting)
#Output is Hello , Bob

name = "Rolf"

print(greeting)

greeting = f"Hello, {name}"
print(greeting)

# Output is Hello , Rolf


# -- Using .format() --

# We can define template strings and then replace parts of it with another value, instead of doing it directly in the string.

greeting = "Hello, {}"
with_name = greeting.format("Rolf")
print(with_name)

longer_phrase = "Hello, {}. Today is {}."
formatted = longer_phrase.format("Rolf", "Monday")
print(formatted)
# The first word goes to the first curly bracket