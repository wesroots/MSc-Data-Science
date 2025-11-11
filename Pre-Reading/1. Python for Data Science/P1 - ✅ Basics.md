---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
[[P3 - ✅ Data Structures & Collections]] - basics needed to manipulate data structures
[[P4 - ✅ User Functions]] - functions use variables/operators
>
> #python
# Intro
>[!note] Exercises
>- [ ]  [[-- Images --/Basics_Exercises.ipynb| General Exercises]]
## Aims
- [ ] Understand what variables, data types, operators are
- [ ] Learn how to use booleans and comparison operators in logic
- [ ] Be able to apply core built-in functions (e.g., `round()`, `divmod()`, `isinstance()`, `input()`)
- [ ] Gain confidence writing and testing simple expressions
## Intro
Core building blocks of Python
- Variables let us store values
- Operators let us act on those values
- Booleans and comparisons let us make decisions (true/false)
- Built-in functions provide quick ways to perform common tasks without writing custom code

# Variables and Data Types
## Variables
Variable : a name that stores a value
```python
# integer: number of rows in dataset
num_rows = 500  

# float: average customer spend
avg_spend = 45.72  

# string: column name
column = "Age"  

# boolean: missing values flag
has_missing = True
```
## Data Types
- `int` - integers
- `float` - decimals
- `str` - string
- `bool` - True/False

# Operators
## Arithmetic
```python
# average spend per row
total_spend = 22860
avg = total_spend / num_rows   # 45.72
```
## Assignment
```python
# update row counter
num_rows = 500
num_rows += 1   # new row added → 501
```

# Boolean Values and Comparisons
## Comparison operators
```python
==  # equal
!=  # not equal
<   # less than
<=  # less than or equal
>   # greater than
>=  # greater than or equal
```
### Example
```python
# check if customer’s income is above threshold
income = 60000
income > 50000   # True
```
## Boolean logic
- `and` - both must be true
- `or` - at least one must be true
- `not` - reverses the truth
```python
# check loan approval condition
credit_score = 720
income = 40000

if credit_score > 700 and income > 35000:
    print("Loan Approved")
else:
    print("Loan Denied")
```
## Operator precedence
Order of evaluation is:
```python
not > and > or
```

# Useful Built-In Functions
## Intro
Python provides many built-ins: a few key ones for basics:
`round(x,n)` -> round number `x` to `n` decimal places
```python
# round average purchase to 2 decimals
avg_purchase = 123.456
round(avg_purchase, 2)   # 123.46
```
`divmod(x,y)` -> returned quotient and remainder as tuple
```python
# split dataset into training and validation batches
rows = 105
batch_size = 20
divmod(rows, batch_size)   # (5 full batches, 5 leftover rows)
```
`isinstance(value, type)` -> checks type
```python
# check if column is numeric
value = 42
isinstance(value, (int, float))   # True
```
`pow(x,y,z)` -> $(x^y)$ % $z$ (% = remainder after division)
```python
# modular exponentiation (used in hashing / encryption)
pow(4, 3, 5)   # (4^3) % 5 = 4
```
`input()` -> read user input (as string)
```python
# simple interactive check
threshold = int(input("Enter income threshold: "))
if income > threshold:
    print("Eligible")
```
`f-strings` -> embed variables into strings
```python
# print dataset summary
rows = 500
columns = 12
print(f"Dataset has {rows} rows and {columns} columns")
```

```python
with
``` 