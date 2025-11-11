---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
[[P7 - ✅ File Handling]] - must handle file errors
> 
> #python

# Intro
>[!note] Exercises
>- [ ]  [[-- Images --/Error_Handling_Exercises.ipynb| General Exercises]]
## Aims
### Understand:
- [ ] What exceptions are
- [ ] Difference between `try` `except` `else` `finally`
- [ ] Why raising your own exceptions is useful
### Be able to:
- [ ] Catch and handle errors
- [ ] Use multiple `except` blocks correctly
- [ ] Recognise and fix common errors (`ValueError`, `TypeError`, `KeyError`, etc.)
## Intro.
### Definition: 
Mechanisms to deal with unexpected situations (runtime errors) so programmes don't crash
- Entails detecting, intercepting, and responding to errors during execution
### Core concept:
- Errors -> exceptions in python
- Handled using `try`, `except`, `else`, `finally`
- Prevents abrupt termination
- Separates normal logic from error recovery logic
	- Normal: what should happen if everything is fine
	- Error recovery: instructions only used if something breaks
### Minimal example:
```python
try:
    x = int("abc")  # will raise ValueError
except ValueError:
    print("Conversion failed")
```
`except` runs when `try` fails
### Types of errors
==Syntax errors==
- Mistakes in code structure (caught before running)
==Runtime errors (Exceptions)==
	- Occur during execution
	- Examples: `ZeroDivisionError`, `ValueError`, `TypeError`
```python
1 / 0   # ZeroDivisionError
```
# Exceptions (`try` & `except`)
## Intro.
An exception -> something went wrong
- Use `try` to run risky code
- Use `except` to catch and handle errors
## Key Syntax
```python
try:
    # Code that might fail
    result = 10 / 0
except ZeroDivisionError:
    print("You cannot divide by zero.")
```
- Python tries code in `try` block
- If error occurs, Python jumps to `except`
- If no error, `except` is skipped
# The `else` and `finally` blocks
## Intro.
```python
try:
    f = open("data.csv")
    data = f.read()
except FileNotFoundError:
    print("File not found.")
else:
    print("File read successfully.")
finally:
    f.close()   # Cleanup always happens
```
- `else` - runs only if the `try` block succeeds
- `finally` - always runs, whether error or not
	- Used for cleanup (closing files, releasing resources)
```python
try:
    f = open("data.csv")
    data = f.read()
    print("File read successfully.")   # ← always runs
except FileNotFoundError:
    print("File not found.")
```
# Raising Exceptions
## Intro.
Sometimes you want to signal your own error when input is invalid
- Use `raise` to stop execution intentionally
```python
def process_age(age):
    if age < 0:
        raise ValueError("Age cannot be negative.")
    return age
```
## Defining an exception class
```python
# Define your own exception class
class NegativeAgeError(Exception):
    pass

def process_age(age):
    if age < 0:
        raise NegativeAgeError("Custom error: Age cannot be negative")
    return age

try:
    process_age(-5)
except NegativeAgeError as e:
    print(f"Caught my custom exception: {e}")
```
# Catching Multiple Exceptions
## Intro.
Handling several possible error types with one `except` block
- Simplifies code when different errors need the same recovery action
- Use grouping when the handling is the same - if recovery differs, use separate `except` blocks
### Syntax
```python
try:
    # risky code
except (ErrorType1, ErrorType2, ...) as e:
    # handle error using e variable
```
- Storing error types in tuple following `except`
- `e` holds the details of the error
### Example
```python
try:
    num = int("abc")      # raises ValueError
    result = 1 / 0        # raises ZeroDivisionError
except (ValueError, ZeroDivisionError) as e:
    print(f"Error caught: {e}")
```
### Accessing the Exception Object (`e`)
```python
try:
    int("abc")
except (ValueError, ZeroDivisionError) as e:
    print(type(e))   # <class 'ValueError'>
    print(e)         # "invalid literal for int() with base 10: 'abc'"
```
### Catching All Error Types
```python
try:
    1 / 0
except Exception as e:
    print(f"Error caught: {e}")
```
- Can hide bugs
# Common Errors in Data Science
## Error Types
- `ValueError` -> wrong value for an operation (e.g., `int(abc)`)
- `TypeError` -> wrong type (e.g., `"3"+5`)
- `KeyError` -> missing dictionary key or DataFrame column
- `IndexError` -> accessing a list index out of range
- `FileNotFoundError` -> file path incorrect

```Python
# Comment: this block demonstrates all syntax types

import math  # import builtin module
from datetime import datetime as dt

CONSTANT = 3.14159  # constant / number
variable_one = 42
variable_two: float = 2.5

class ExampleClass:
    """Docstring: represents a class example"""

    def __init__(self, name: str, value: int = 10):
        self.name = name          # instance variable
        self._hidden = value * 2  # private variable

    def method(self, factor: float) -> float:
        """Demonstrates a function definition"""
        if factor > 0:
            result = self._hidden / factor
        else:
            result = float("nan")
        return result

def outer_function(x: int) -> int:
    """Function with inner scope and lambda"""
    inner = lambda y: y ** 2  # lambda expression
    return inner(x) + sum([1, 2, 3])

# Builtin function and exception handling
try:
    obj = ExampleClass("test")
    print(obj.method(variable_two))
except (ValueError, TypeError) as e:
    print(f"Error occurred: {e!r}")
finally:
    print("Execution complete.")

# Comprehension, set, tuple, dict, f-string, and operator usage
data_list = [n for n in range(5)]
data_tuple = tuple(data_list)
data_set = {x ** 2 for x in data_list}
data_dict = {k: v for k, v in enumerate(data_set)}

print(f"{dt.now()}: Results -> {data_dict} | Types: {type(data_dict)}")

# Keyword, logical operator, and builtin usage
if all(isinstance(x, int) for x in data_list) and not any(x < 0 for x in data_list):
    print(len(data_set), max(data_set), min(data_set), sum(data_set))

# Decorator and generator example
def decorator(func):
    def wrapper(*args, **kwargs):
        print("Before call")
        result = func(*args, **kwargs)
        print("After call")
        return result
    return wrapper

@decorator
def generator_example(n: int):
    for i in range(n):
        yield i ** 2

for val in generator_example(3):
    print(val)

```