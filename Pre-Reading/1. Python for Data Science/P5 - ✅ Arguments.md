---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
[[P6 - ✅ Error Handling]] - passing wrong arguments can raise errors
> 
> #python

# Intro
>[!note] Exercises
>- [ ]  [[Arguments_Exercises.ipynb | General Exercises]]
## Aims

# Arguments
**Actual or data passed into a function ([[P4 - ✅ User Functions]], [[P.1 Useful Built-In Functions]]) when called**
## Positional arguments
- ==Definition:== Matched to a function's parameters by position (order), not by name
- ==Use:== Common order (width, height: x, y), mandatory arguments
```python
import numpy as np

data = [10, 20, 30, 40, 50]

# Positional argument for the main data
mean_value = np.mean(data)
print(mean_value)  # 30.0
```
==Pros:== Simple, performance

## Keyword arguments
- ==Definition:== an argument passed to a function by explicitly sating the parameter's name in the function call
- ==Use:== Flexible order, skipping parameters, reduces bug risk
```python
# Syntax:
function_name(parameter_name=value)

# Example:
import pandas as pd
df = pd.read_csv(
	filepath_or_buffer="sales_data.csv", # Location of data
	sep=",", # Defines delimiter
	header=0, # Defines header
	usecols=["Date", "Sales"], # Only load certain columns
	parse_dates=["Date"], # Automatically parse date (read text & convert to typed data)
	na_values=["NA","null"] # Treat these as missing values
)

print(df.head())
```
==Pros:== unnecessary parameters skipped - e.g., if all columns to be shown, `usecols` can be ignored

## Default arguments
==Definition:== A parameter that has a pre-set value in the function definition. If no argument is passed for it, Python uses the default value automatically
==Use:== Make some arguments optional without breaking function call. Can override defaults you care about without touching the others
```python
def log_message(message, level="INFO")
	print(f"[{level}] {message}")

log_message("System started") # [INFO] System started
log_message("Disk almost full", "WARN") # [WARN] Disk almost full
```
==Pros:== avoid repeating same value in every call, lower risk of bugs

# Variable-length Arguments (`*args` and `**kwargs`)
## Intro.
**Flexible parameters - accepts unlimited positional or default arguments. Outputs tuple or dictionary**
- Supports all keywords (including ones not specified in function) - no need to predefine or update parameters
## args
==Accepts any number of positional arguments as a tuple==
```python
import pandas as pd

# Sample DataFrame
df = pd.DataFrame({
    "A": [1, 2, 3],
    "B": [4, 5, 6],
    "C": [7, 8, 9]
})

def sum_columns(dataframe, *args):
    # *args is a tuple of column names
    return dataframe[list(args)].sum(axis=1)

# Call with any number of column names
result = sum_columns(df, "A", "B")
print(result)

result2 = sum_columns(df, "A", "B", "C")
print(result2)
```

## kwargs
==Accepts any number of keyword arguments as a dictionary==
```python
import pandas as pd

def load_data(file_path, **kwargs):
    return pd.read_csv(file_path, **kwargs)

# Call with extra keyword arguments for read_csv
df = load_data(
    "sales.csv",
    sep=";",               # different delimiter
    parse_dates=["Date"],  # automatically convert date column
    na_values=["NA", ""],  # treat NA and empty as missing
)

print(df.head())
```

# Argument Unpacking
## Intro.
**Expanding a sequence (`*`) or dictionary (`**`) into separate arguments when calling a function**
==Used for:==
- Needed when passing arguments stored in a list/tuple/dict without manually typing each one
- Forwarding parameters between functions
## args - positional unpacking
```python
import pandas as pd

def describe_three(col1, col2, col3):
    return {
        "means": [col1.mean(), col2.mean(), col3.mean()]
    }

df = pd.DataFrame({"A":[1,2,3],"B":[4,5,6],"C":[7,8,9]})
cols = [df["A"], df["B"], df["C"]] # defines columns in list

# Unpack the list of Series into positional args
stats = describe_three(*cols)   # same as describe_three(df["A"], df["B"], df["C"])
```
## kwargs - keyword unpacking
```python
import pandas as pd

# Parameters for reading the CSV
read_params = {
    "sep": ";",        # delimiter is semicolon
    "header": 0,       # first row contains column names
    "na_values": ["NA", ""],  # treat these as missing values
}

# Apply parameters when reading the CSV
df = pd.read_csv("sales.csv", **read_params)

print(df.head())
```
==Use case:== saving parameter-argument pairs in `read_params` and applying to `df`
- `kwarg` not used for csv file in example, positional argument used
# Returning multiple values
## Intro.
When functions return >1 value as a tuple, they can be unpacked into separate variables when calling the function
## Unpacking multiple values
==Simple example==
```python
# Returning multiple values
def stats(a, b)
	return a+b, a*b

# Unpacking return values
sum_, product = stats(3, 4)
```

==Data science example==
```python
import pandas as pd

# Load the CSV into a DataFrame
df = pd.read_csv("sales_data.csv")

# Function returns the mean of two columns
def sales_stats(col1, col2):
    return col1.mean(), col2.mean()

# Pass columns from df into the function
mean_q1, mean_q2 = sales_stats(df["Sales_Q1"], df["Sales_Q2"])

# Output results
print("Mean Q1 Sales:", mean_q1)
print("Mean Q2 Sales:", mean_q2)
```

However, generally easier to return a dictionary:
```python
import pandas as pd

# Load CSV
df = pd.read_csv("sales_data.csv")

def sales_stats(col1, col2)
	return {
		"mean_q1": col1.mean()
		"mean_q1": col2.mean()
	}

# Get results as a dictionary
results = sales_stats(df["Sales_Q1"], ["Sales_Q2"])

print(results["mean_q1"]) # access Q1 mean by key
print(results["mean_q2"]) # access Q2 mean by key
```

