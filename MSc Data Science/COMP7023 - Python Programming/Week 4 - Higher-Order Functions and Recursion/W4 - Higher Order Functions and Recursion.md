---
Module: Python Programming
Week Beginning: 2025-10-27
Note Type:
  - Lecture
tags:
  - COMP7023
---
>[!note] Lecture Notes (Post-Lecture Checklist)
>**These points were written during the lectures + seminars throughout the week to capture key ideas and actions for review - the following notes expand on checklist items through post-lecture reflection and structured consolidation**

---

# Chapter 4: Designing Functions
**Intro:** Each function should have **exactly one macro job**
**Purpose:** used to avoid code repetition
## 4.1 - Documentation
**Docstring:** documentation describing the function
- Docstring shows as pop-up in most IDEs
```python
def function1(parameter):
	"""
	This is docstring
	"""
	
	return parameter
```
## 4.2 - Testing
**Testing:** verifying a function's behaviour matches expectations
**`assert` statements:** verify expectations
- Has an expression in a boolean context
- When `True` -> no effect
- When `False` -> error thrown up
```python
assert square(7) == 49 # True, no effect
assert square(7) == 50 # False, error thrown up
```
## 4.4 - Programming by Contract
- Docstring of function documents what function does
- A **contract** defines what a function guarantees and what it expects
	- **Precondition:** what must be true *before* calling the function
	- **Postcondition:** what will be true *after* the function runs
	- Contract = Precondition + Postcondition
```python
def cylinder_volume(r,h):
	"""
	Compute cylinder volume.
    r – radius in meters (number >= 0)
    h – height in meters (number >= 0)
    Returns: volume in cubic meters (number >= 0)
	"""
	return pi * r * r * h
```
## 4.5 - Debugging
- **Defect (bug):** the cause - an error in the code
- **Failure:** the symptom - what happens when defect makes programme behave incorrectly
## 4.6 - Extra: Default Argument Values
- Functions with many arguments can be awkward to call and difficult to read
- Default values can be provided with optional arguments
```python
def pressure(v, t, n=6.022e23):
	"""
	Compute the pressure in pascals of an ideal gas
	
	v - volume of gas, in cubic metres
	t - absolute temperate in degrees kelvin
	n - particles of gas (default: one mole)
	"""
	k = 1.38e-23 # Boltzmann's constant
	return n * k * t / v
```
# Chapter 5:  Higher Order Functions
**HOFs:** functions that take or return other functions
**Purpose:** Allows generalising patterns such as summation so that the function can work with *any formula*, not just numbers or cubes
## 5.1 - Functions as Arguments
### 1. The pattern problem
We have 3 similar functions:
```python
def sum_naturals(n):
    total, k = 0, 1
    while k <= n:
        total += k
        k += 1
    return total

def sum_cubes(n):
    total, k = 0, 1
    while k <= n:
        total += k**3
        k += 1
    return total

def pi_sum(n):
	total = 0
	k = 1
	while k <= n:
		total = total + 8 / ((4*k-3) * (4*k-1))
		k = k + 1
	return total
```
### 2. Abstraction idea
We abstract the shared structure into one function that takes another function `term` to compute the value each iteration should add
```python
def summation(n, term):
    total, k = 0, 1
    while k <= n:
        total += term(k)
        k += 1
    return total
```
Now `summation` is a **higher-order function** - it receives another function as input
### 3. Usage examples
```python
def cube(x): return x**3
def identity(x): return x
def square(x): return x*x

summation(10, identity)  # → 55  (sum of naturals)
summation(10, cube)      # → 3025  (sum of cubes)
summation(10, square)    # → 385  (sum of squares)
```
- `summation(10, cube)` means "run summation with `n=10` and use `cube(k)` every iteration"
- `term(k)` becomes the function passed as an argument acting on `k`
Summations can be created easily:
```python
def pi_term(k):
    return 8 / ((4*k-3)*(4*k-1))

summation(1_000_000, pi_term)  # ≈ 3.141592...

```
### 4. Key concept
- A function can be treated like data: passed around, stored, or used inside another function
- This lets us express general patterns once and reuse them with different operations
## 5.2 - Functions as General Methods - GR $\phi$
### 1. Idea
- **HOFs** don't just generalise specific tasks - they can also capture general methods of computation - reusable problem-solving patterns
- Instead of defining "how to sum cubes," we can define "how to improve an estimate until its close enough" and then reuse the same method for many problems
### 2. The example
General iterative-improvement process:
```python
def improve(update, close, guess=1):
	while not close(guess):
		guess = update(guess)
	return guess
```
- `update` - a function describing how to make a better guess
- `close` - a function that checks if the guess is "good enough"
- `guess` - starting value
### 3. Applying it - example: finding the golden ratio $\phi$
$\phi$ -> a specific proportion or balance between two parts where the smaller element ($a$) as a proportion of the larger element ($b$) is the same as the larger element ($b$) as a proportion of the whole ($a+b$)
- Applies to only a pair of quantities
	- $\tfrac{a}{b} = \tfrac{b}{a+b}$
- A well-known property is that it can be computed by repeatedly summing the inverse of any positive number with 1
	- $x_{n+1} = 1 + \tfrac{1}{x_n}$
**We define the behaviour we need:**
```python
# Rule for improving guess
def golden_update(guess):
	return 1/guess + 1

# Test if phi^2 = phi + 1 -> at convergence this is satisfied - does not work with further off guesses
def square_close_to_successor(guess):
	return approx_eq(guess * guess, guess + 1)

# Returns true if x and y are nearly linearly equal
def approx_eq(x, y, tolerance=1e-15):
	return abs(x-y) < tolerance

improve(golden_update, square_close_to_successor)
# → 1.618033988749895 (approx. phi)
```
**Steps:**
`improve()` starts
- While loop keeps `golden_update()` (passed as `update` argument in improve)
- `square_close_to_successor()` creates conditions for `approx_eq()`
	- E.g., $x^2$, $x+1$
- `approx_eq()` takes conditions of `square_close_to_successor()` and returns `True` or `False` which determines if `golden_update()` continues
- If `golden_update()` while loop ends -> `guess` is returned as final output
## 5.3 - Defining Functions III: Nested Definitions
### 1. Idea
Nested functions:
- keep helper functions local
- let inner functions access variables from outer function
- make code modular and self contained
This is called **lexical scoping**
### 2. Example - Square root via Newton's method
We want to find $\sqrt{a}$
```python
def sqrt(a):
	def sqrt_update(x):
		return (x + a/x) / 2
	def sqrt_close(x):
		return approx_eq(x * x, a)
	return improve(sqrt_update, sqrt_close)
```
- `sqrt_update` and `sqrt_close` exist only while `sqrt` runs
- Both can see `a` because of **lexical scope** - inner functions inherit access to variables defined in their enclosing function
- When you call `sqrt(256)`, Python builds a small environment chain (chain of looking for `a`):
	- `sqrt_update` -> `sqrt` -> `global`
### 3. Key terms
- **Lexical scope:** Inner functions can read from where they were defined, not where they are called
- **Parent environment:** the environment in which a function was originally defined
- **Closure:** a function that "remembers" variables from its defining environment even after that environment has finished executing
## 5.4 - Functions as Returned Values
### 1. Idea
A function can return another function
- The returned function remembers variables from the environment it was created in
- That returned inner function + its saved environment = a closure
### 2. Example - Function composite
We can define a function that combines two functions `f` and `g` into one
```python
def compose1(f, g):
	def h(x):
		return f(g(x))
	return h

# call by either:
compose1(func1, func2)(x)

# or:
new_func = compose1(func1, func2)
new_func(x)
```
## 5.5 - Example: Newton's Method
Newton's method is a way to make a guess for a number and keep improving it until it's close to the answer
- Start with a guess, check hwo far off you are, adjust the guess, and repeat
- That same idea can be written once and reused for many problems

You can write a function that does the "improving" steps but lets the user give it other functions to decide:
- How to update the guess
- How to check if it's good enough
**Newton's method is just an example of using functions as inputs to make a general "improvement" pattern**
## 5.6 - Currying
Currying means turning a function that takes two inputs into one that takes them one at a time
**Instead of:**
```python
pow(2,3)
```
**you can imagine:**
```python
pow_curried(2)(3)
```
Not used too much - allows functions to be built step-by-step
## 5.7 - Lambda Expressions
### Intro
A lambda function is a small, unnamed function that you can write inline. Form:
```python
lambda x: expression_of_x
```
It behaves like:
```python
def temp(x):
	return expression_of_x
```
### Example:
```python
lambda c: c.isupper()
```
## 5.8 - Abstractions and First-Class Functions
### Intro
Functions in Python can be treated like normal data. You can:
- store them in variables
- give them to another function
- return them from another function
### Example:
```python
def shout(c):
	return c.upper()

mat_str(shout, abc)
```
## 5.9 - Functions Decorators
A decorator is a quick way to make one function run inside another automatically
```python
def trace(f):
	def inner(x):
		print("calling", f.__name__)
		return f(x)
	return inner
```
and then write:
```python
@trace
def triple(x):
	return 3 * x
```
the `@trace` line means:
```python
triple = trace(triple)
```
Whenever you call `triple(10)`, it first prints "calling triple" then runs the real function. Decorators are just wrappers that add extra behaviour without changing the original code
# Chapter 6: Recursive Functions
## 6.1 Recursive Function Definitions
**Purpose:** A function can call itself to solve smaller versions of the same problem
### Core idea:
- Define a problem in terms of itself until you hit a simple "base case"
- Two essential parts:
	1. Base case - the stopping point that returns a direct answer
	2. Recursive case - the function calls itself with a simpler input
### Key points
- Every recursive function must reduce the problem somehow
- Without a base case -> infinite recursion (`RecursionError`)
- Each call is pushed into the call stack, which stores where to return the result
## 6.2 Mutual Recursion
**Purpose:** Two or more functions can call each other recursively
### Concept:
Instead of a single function recursing on itself, they take turns
For instance:
- Function A handles one case but delegates to B for the next
- B then calls A again with a simpler version
Example:
- "Even/odd" checker - `is_even(n)` calls `is_odd(n-1)` and vice versa, until reaching 0
## 6.3 Printing in Recursive Functions
**Purpose:** used to trace how recursion unfolds and returns
### Concept
- Printing the argument on each call shows depths of recursion
- Printing again before each return shows how results travel back up
### What it teaches:
- Helps you see the call stack grow and shrink
- Builds understanding of flow of execution, not efficiency
## 6.4 Tree Recursion
**Purpose:** Some problems branch into multiple recursive calls instead of one
### Concept
- Each call may spawn in one or two more further calls -> forming a recursion tree
- Common example: Fibonacci numbers
### Idea
$$
\text{fib}(n) = \text{fib}(n-2) + \text{fib}(n-1)
$$
Each call expands into two or more until reaching base cases (n=0 or 1)
### Key points
- Grows exponentially in number of calls
- Shows how recursion models branching structures
- Inefficient because of repeated subcalls
