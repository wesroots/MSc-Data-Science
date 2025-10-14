---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
[[P9 - ✅ Object-Oriented Programming (OOP)]] - classes often wrap or extend data structures
>
> #python

# Intro
>[!note] Exercises
>- [ ]  [[Data_Structures_Exercises.ipynb | General Exercises]]
## Aims
## Intro
Data structures act as collections of variables or values including:
- Lists
- Tuples
- Sets
- Dictionaries
- Strings (briefly, as a sequence)
- Range, zip, enumerate (as iterable tools)
# Data Structures
## 1. List `[ ]`
**Ordered, mutable, allows duplicates**
### When to use:
- Order matters
- Duplicates expected and needed
- When items need to be added, removed, changed frequently
### Examples & why useful:
- Shopping cart items, sequence of sensor readings, names of students in class
- Dynamic size, easy to iterate, sort, modify 
```python
fruits = ["apple", "banana", "cherry"]

print(fruits[1]) # banana
fruits.append("grape")
```

## 2. Tuple `( )`
**Ordered, immutable, allows duplicates**
### When to use:
- When values should not change
- When Python returns multiple values from a function
### Examples & why useful:
- Coordinates, RGB colour values, dates & time (when immutability makes sense)
- More memory-efficient than lists, safer to use when preventing changes
```python
location = (52.3765, 4.9053)

print(location[0]) # 52.3765
```

## 3. Set `{ }`
**Unordered, mutable, no duplicates**
### When to use:
- For a collection of unique values
- When you need fast membership testing (`x in my_set`)
- When working with mathematical set operations:
```python
a = {1, 2, 3}
b = {3, 4, 5}

print(a & b) # intersection => {3}
print(a | b) # union => {1, 2, 3, 4, 5}
print(a - b) # difference => {1, 2} (everything in a but minus b)
```
### Examples & why useful:
- Unique visitor IDs to a website, all tags used in blog post, removing duplicates from a list
- Uniqueness, fast lookups and comparisons, unordered and unindexed
```python
my_set = {"apple","banana","apple"}

print(my_set) # {"apple", "banana"}
print("banana" in my_set) # True
```

## 4. Dictionary `{ }`
**Key-value pairs, mutable, no duplicate keys**
### When to use:
- When fast lookup by key needed
- When mapping identifiers to values needed
### Examples & why useful:
- Student info, frequency counts, database-style row structures
- Extremely powerful for structured data, fast access, unique keys, infinite values
- Can be created/modified in one line ([[P11 - Comprehensions]])
```python
student = {"name": "Alice", "age": 21, "major": "Data Science"}

print(student["major"]) # Data Science
```
### Dictionary methods **(important)**
Dictionaries are core for working with datasets (like row records or feature mappings). Beyond direct look up, use these methods:
- `.get(key, default)` -> looks up value by its key
	- `default` parameter is the value returned if key isn't found in dictionary
```python
response = {
    "age": 30,
    "country": "UK"
}

# Without .get:
print(response["income"])  # ❌ KeyError crash if "income" missing

# Using .get:
print(response.get("income", "No response"))  # "No response"
```
- `.items()` -> returns all key-value pairs as tuples
```python
passenger = {
    "Name": "John Doe",
    "Age": 35,
    "Class": "3rd",
    "Survived": False
}

for key, value in passenger.items():
    print(key, ":", value)

# Output
# Name : John Doe
# Age : 35
# Class : 3rd
# Survived : False
```
- `.keys()` / `.values()` -> get just the keys or values
```python
house = {
    "Location": "London",
    "Bedrooms": 3,
    "Price": 550000,
    "Has_Garden": True
}

print(house.keys())

# Output:
# dict_keys(['Location', 'Bedrooms', 'Price', 'Has_Garden'])
```
## 5. String (as a sequence)
A sequence of characters. Immutable
- Acts like: a list of characters
### Example
```python
word = "hello"

print(word[1]) # e
```
### String methods
Strings often need cleaning before analysis. Common operations:
- `.lower()`/`.upper()` -> convert to lowercase/uppercase
- `.strip` -> remove spaces or characters
```python
text = "   hello world   "
cleaned = text.strip()
print(cleaned)  # "hello world"

s = ">>>hello<<<"
print(s.strip("><"))  # "hello"
```
- `.split` -> split into words or tokens
```python
sentence = "Python is fun"
words = sentence.split()
print(words)  # ["Python", "is", "fun"]

# With a delimiter
csv = "a,b,c,d"
parts = csv.split(",")
print(parts)  # ["a", "b", "c", "d"]
```

# Iteration Tools
## 1. Range
Generates a sequence of numbers
- Syntax: range(start, stop, step)
- Useful for: looping fixed numbers
### Example
```python
for i in range(1,10,2)
	print(i) # 1, 3, 5, 7, 9
```
## 2. Enumerate
Used to get index and value while looping over a sequence
- Useful for: indexed iteration
### Example
```python
items = ["apple", "banana"]

for i, item in enumerate(items):
	print(i, item)
```
## 3. Zip
Combines multiple iterables element-wise
- Useful for: pairing data together
### Example
```python
names = ["Alice", "Bob"]
scores = [90, 85]

for name, score in zip(names, scores):
	print(name, score)
```
