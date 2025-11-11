---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
> [[P9 - ✅ Object-Oriented Programming (OOP)]] - packages often built from classes
> 
> #python
# Intro
>[!note] Exercises
>- [ ]  General -> [[-- Images --/M and P Exercises.ipynb]]
## Aims
- [ ] Understand how to use Python's built-in and external libraries
- [ ] Know how to import functions and classes
- [ ] Write simple reusable modules yourself
- [ ] Understand package structure
## Intro
***==A module:==*** a single `.py` file containing functions, classes, variables
***==Packages:==*** a collection of modules in a folder, with an `__init__.py` file to make it importable
- The `__init__.py` file tells Python "this folder is a package" so it can be imported
	- Can be completely empty
	- Optional in Python 3.3 or newer but included for clarity
These are the foundation of all libraries used in MSc (NumPy, Pandas, Scikit-learn, etc.)

# Importing Modules
## Intro
### Syntax
```python
import math                 # import whole module
from math import sqrt       # import one function
import math as m            # alias
```
## Importing two modules with a same-named function
Two methods:
### Use module prefixes (recommended)
```python
import math
import cmath

print(math.sqrt(16))   # 4.0 (real square root)
print(cmath.sqrt(-16)) # 4j (complex square root)
```
### Use aliases
```python
from math import sqrt as real_sqrt
from cmath import sqrt as complex_sqrt

print(real_sqrt(16))     # 4.0
print(complex_sqrt(-16)) # 4j
```

## Importing from a package folder
### Example
```markdown
mypackage/
	__init__.py
	data_utils.py
	stats_utils.py
```
### Usage
```python
from mypackage.data_utils import load_data
```
## Default built-in Python modules:
- `math` -> numerical functions (`sqrt`, `log`,`pi`)
- `random` -> random numbers (`random.random()`,`randint`)
- `datetime` -> dates and times (`datetime.now()`)
- `os` -> interact with operating system (paths, files)
- `sys` -> system-level info (command-line args, exit)

# Creating Custom Module (your own)
## Syntax
### 1. Create a file `mymath.py`:
```python
def square(x):
	return x*x
```
### 2. In another file:
```python
import mymath
print(mymath.square(5)) # 25
```

# Summary
## Common Pitfalls
- Forgetting to use `from ... import ...` correctly
- Circular imports (two modules importing each other)
- Wrong file paths when importing your own module
