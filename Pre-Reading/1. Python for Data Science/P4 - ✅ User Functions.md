---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
[[P5 - ✅ Arguments]]
[[P6 - ✅ Error Handling]] - functions often include error handling
[[P12 - Functional Programming Tools]] - builds on user defined functions
> 
> #python

# Intro
>[!note] Exercises
>- [ ]  [[User_Functions_Exercises.ipynb | General Exercises]]
## Aims

# Basic Functions
## Syntax/Intro
**Function** - a named block of code that you can run (or call) whenever you want instead of writing the same code over and over again
```python
def function_name():
	# Code goes here
	print("This runs when you call the function")

function_name() # This runs the function and executes code inside
```
`def` defines a function
`()` after function name is required to call it, even without parameters
`print()` used when you want to show output immediately
`return` used when you need to use the function code's output where the function was called
- E.g., when a function calculates tax based on certain parameters, the function should return the calculated tax value to where the function was called

## Function with parameters/arguments
```python
# Defining function
def apply_discount(price, discount_percent)
	discount_amount = price * (discount_percent/100)
	final_price = price - discount_amount
	return final_price

# Calling/using function
print(apply_discount(100,20)) # Output: 80.0
print(apply_discount(45, 10)) # Output: 40.5
```
==Parameter:== a placeholder for a variable (e.g., `price`, `discount_percent`)
==Argument:== value inputted in place of a parameter

## Function using both `print()` and `return`
```python
# Defining function
def estimate_travel_time(distance_km, average_speed_kmh):
	if average_speed_kmh <= 0
		print("Speed must be greater than zero.")
		return None
	time_hours = distance_km / average_speed_kmh
	return round(time_hours, 2)

# Calling/using function
trip1 = estimate_travel_time(100, 80)
if trip1 is not None
	print(f"Trip 1 will take {trip1} hours.") 
# Output: Trip 1 will take 1.25 hours.

trip2 = estimate_travel_time(250, 60)
if trip2 is not None
	print(f"Trip 2 will take {trip2} hours.")
# Output: Trip 2 will take 4.67 hours.
```
**Why `return None` and `if trip1 is not None` are needed in this example**
- `return None` is used to say "Something went wrong or input was invalid, returned result is not a real result"
- Returning an `average_speed_kmh` value of <=0 would crash due to `ZeroDivisionError`

# Arguments
## [[P5 - ✅ Arguments]]

# Scope and Lifetime of Variables
## Intro
**Where a variable exists and when it’s created/destroyed depends on its scope: a functions topic - applies beyond functions**
## Local scope
- ==Definition:== variables created inside a function
- ==Lifetime==: exists only while function runs
- ==Access:== Only inside that function
```python 
import pandas as pd

df = pd.DataFrame({"Sales": [100, 200, 150, 175]})

def calc_mean_sales(dataframe):
    mean_sales = dataframe["Sales"].mean()  # local variable
    return mean_sales

result = calc_mean_sales(df)
print(result)
```
`mean_sales` is **local scope** -> it only exists inside the `calc_mean_sales()`
- if `mean_sales` is used outside `calc_mean_sales` -> `NameError`

## Global scope
- ==Definition:== variables defined outside any function
- ==Access:== can be read inside/outside functions
- ==Modification:== requires `global` kw inside function
```python
import pandas as pd

# Global DataFrame
df = pd.DataFrame({
    "Name": ["Alice", "Bob", "Charlie"],
    "Sales": [250, 400, 300]
})

def add_discount_column():
    global df  # allows modification of the global df
    df["Discount"] = df["Sales"] * 0.1  # add new column

add_discount_column()
print(df)
```
Including `global [variable name]` allows python to modify identifier inside function
- Without `global`, Python treats variable as local -> modifying it causes `UnboundLocalError` -> can still be read and used
- Data it points to can be modified in place (e.g., `Alice` can be changed to `Alex` under `Name` identifier)
Within a file, if defined before, global scopes are always available ✅ 

## Enclosing (nonlocal) scope
- ==Definition:== variables in an outer function, used by nested inner function
- ==Access:==
- ==Modification:== Requires `nonlocal` kw in inner function
```python
def analyse_column(): # outer function stores placeholder
    col_mean = None  # outer variable

    def set_mean(series): # calc. mean and updates variable
        nonlocal col_mean  # modify outer variable
        col_mean = series.mean()

    import pandas as pd
    df = pd.DataFrame({"Sales": [100, 200, 300]})
    set_mean(df["Sales"])  # inner function updates outer variable
    return col_mean

print(analyse_column())  # Output: 200.0
```
Outer function stores `col_mean` placeholder - inner function calculates mean and updates outer variable using `nonlocal`
- Without `nonlocal`, Python would create a new `col_mean` inside inner function and leave outer variable unchanged

## Built-in scope
- ==Definition:== Python's reserved kws and built-in functions
- ==Examples:== `len`, `print`, `min`, `sum`, `max`
- ==Lifetime:== always available, no need to import or define

# Docstrings (function documentation)
## Intro.
==Definition:==
A special string placed at the very start of a function (inside it) that explains:
- What the function does
- What parameters it takes
- What it returns
`"""written in triple quotes"""`
==Why useful:==
- Acts like documentation
- Shows up when `help(function_name)` is used
- Makes it easier to understand code months later or when collaborating
```python
def calculate_discount(price, rate):
    """
    Calculate discount amount.

    Parameters:
    price (float): Original price
    rate (float): Discount rate as decimal (e.g., 0.2 for 20%)

    Returns:
    float: Discounted price
    """
    return price - (price * rate)

help(calculate_discount)  # Shows this docstring
```

# Anonymous (Lambda) functions
## Intro.
==Definition:==
Lambda function - a short, anonymous function (no name unless assigned to a variable)
- Defined with `lambda` keyword
- Can only contain one expression (no loops, multiple statements etc.)
==Why useful:==
- Doesn't clutter code with `def` block
- Far less overhead than defining functions
**Generally only useful when iterating through a data collection**
## Syntax
```python
lambda parameters: expression

# Example
double = lambda x: x*2
print(double(5))
```

## Use-case example
With/without lambda
```python
# WITHOUT
# Defining a function to get sorting key of each value in list
def get_key(list_val):
    return list_val[1]

my_list = [(1, 3), (2, 1), (3, 2)]
	sorted(my_list, key=get_key) # sorts using get_key function

# WITH
my_list = [(1, 3), (2, 1), (3, 2)]

sorted_list = (sorted(my_list, key=lambda x: x[1]))
# ^ iterates over list using x[1] to find key and prints sorted list

print(sorted_list) # [(2, 1), (3, 2), (1, 3)]
```

# Nested functions
## Intro.
- ==Definition:== a function defined inside another function
## Closure 
==Definition:== a nested function that uses variables from the outer function's scope. It remembers variables even after the outer function has finished running
==Why useful:== No need to use global variables -> less overhead
```python
def outer():
	message = "Hello"
	def inner():
		return message
	return inner

greet = outer()

print(greet()) # Hello
```
1. Python remembers `message` defined in `outer`. 
2. The result of `outer` (`outer()`/`inner`) is stored in `greet`
3. `greet` is printed by running `inner` -> `inner` remembers `message` although `outer` has closed

# Decorators
## Intro.
==Definition:== a function that takes another function as input, adds functionality and returns a new function
- **a template for functions - treats them as nested functions**
## Syntax
```python
import pandas as pd

# Decorator
def check_size(func):
    def wrapper():
        data = func() # 1.
        print(f"Loaded {len(data)} rows") # 2.
        return data # 3.
    return wrapper

# @check_size followed by a defined function passes the defined function into the check_size(func) decorator
@check_size
def load_data():
    return pd.read_csv("example.csv")

# Run it
dataset = load_data()
```
A decorator must have a function (`check_size`) that takes another function as input (`func`) and returns a new function (`wrapper`)
## Summary in short
==Decorator function:==
- `check_size` is the decorator function
- Its job is to accept a function to be wrapped `func` or `load_data`
- It returns a new function (`wrapper`)
==Wrapper function:==
- `wrapper` contains decorating behaviour, defined inside decorator
- What runs when decorated function is called
- Runs `func()` plus extra stuff
==func() behaviour:==
- When defined, rewritten as `func = check_size(func)`
	- Decorators replace original defined `func` with the decorated one
- Therefore, `func` should usually be defined as decorator is called to avoid stop function being rewritten

# Recursion
## Intro.
==Definition:== a function that calls itself
- Always has two parts:
	1. ***==Base case==*** -> when the function should stop
	2. ***==Recursive case==*** -> when the function calls itself again with a smaller or simpler problem
- Similar to [[P2 - ✅ Control Flow]] - without ***==base case==*** the function would loop forever and crash with a `RecursionError`
## Syntax
```python
import pandas as pd

data = {
    "age": [25, 30, None, 40],
    "income": [50000, None, 60000, None]
}
df = pd.DataFrame(data)

# Recursive function
def count_missing(values):
    if len(values) == 0:                 # base case
        return 0
    else:                                # recursive case
        return (1 if pd.isna(values[0]) else 0) + count_missing(values[1:])

```
![[Screenshot 2025-08-17 at 13.30.17.png]]
==Explanation:==
- `count_missing(values[1:])`
	- **==Count from the second value onwards in ==***`values`
	- When a function is called, Python creates a new "frame" on the call stack. The frame has its own `values` variable
	- When `count_missing(values[1:])` runs, it:
		- takes current call's values
		- takes off first element
		- passes that smaller list into a ***==new call==*** to `count_missing`
- `return 0`
	- This return is never needed in the original `count_missing` if rows exist in `values` column - it is only included in the recursions of when the list is stripped down
	- If DF col. values exist: `else` `return` is always hit before original `if` `return` is hit