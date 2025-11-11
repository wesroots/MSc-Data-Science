---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
> [[P8 - ✅ Modules and Packages]] - file reading/writing often combined with external packages (csv, json)
> 
> #python 
# Intro
>[!note] Exercises
>- [ ]  [[File Handling Exercises.ipynb | General Exercises]]
## Aims
- [ ] Open, read and write files in Python
- [ ] Use context managers safely (`with open(...) as f`)
	- [ ] `with` = keyword
	- [ ] `open(...)` = context manager object
	- [ ] `as f` gives a variable to work with inside block
- [ ] Understand CSV basics with `csv` and `json` built-in Python modules
- [ ] Be ready to load datasets before using pandas
## Intro
- File handling - working with data stores in text files, CSVs or JSON
	- Need to know raw Python first before loading CSV/JSON files
	- Key skills:
		- Reading/writing text
		- Handling encodings
		- Parsing structured formats

# Reading/Writing Text Files
## Syntax
`open()` is a Python function to connect a file
```python
with open("data.txt", "r") as f:
    content = f.read()   # loads the whole file as a string
print(content)
```
- `r` = read mode -> looking at file contents
- `w` = write -> overwrite and create a new file
	- if file doesn't exist -> creates a new one
	- `w` by design means: starting fresh, overwrite what was there
- `a` = append -> add to end of a file

# Importance of `with` keyword
```python
with open("data.txt", "r") as f:
    content = f.read()   # loads the whole file as a string
print(content)
```
- `open("file.txt", "r") as f` creates a file object `f`
	- `as f` allows for the file object to be handled
- When the `with` block finishes (whether normally or due to error), Python automatically closes the file
	- `__enter__()` -> runs when block starts (opens file, gives handle `f`)
	- `__exit__()` -> runs when the block ends (closes the file)

# CSV basics (`csv` module)
In Python, `csv` module can be used, but Pandas will mostly be used later
## Reading CSV files (Low-Level with `csv`)
```python
import csv

with open("data.csv", "r") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
```
- `csv.reader(f)` treats each line as a list of values
- `row` is a list of strings
## Writing CSV files
```python
import csv

with open("out.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["Name", "Age"])
    writer.writerow(["Alice", 23])
    writer.writerow(["Bob", 30])
```
- `writerow` writes one row at a time
- `newline=""` prevents blank lines appearing on Windows
	- On Windows each `write.writerow()` inserts a black row between real rows - `newline=""` avoids that
## CSV best practice (Pandas)
```python
import pandas as pd
df = pd.read_csv("data.csv")
print(df.head())
```
- `read_csv()` turns the file into a DataFrame (table-like object)
- Much faster, handles large files, adds automatic parsing (dates, numbers, headers)
	- Parsing = interpreting raw text into correct Python data type
### Pandas chunking
Reading a large file in smaller pieces instead of all at once
- Can exceed RAM and crash programme
```python
import pandas as pd

for chunk in pd.read_csv("big.csv", chunksize=1000):
    print(chunk.shape)   # each chunk is a 1000-row DataFrame
```
Example use:
```python
total, count = 0, 0

for chunk in pd.read_csv("big.csv", chunksize=100000):
    total += chunk["price"].sum()
    count += chunk["price"].count()

mean_price = total / count
```
- Means can be calculated chunk by chunk
# Data Science Context
## Use
- CSVs are the most common format in Kaggle, research papers, finance APIs, government datasets
- Before Pandas: `csv.reader` helps you understand what's happening
- With Pandas: you do everything from cleaning -> analysis -> visualisation
## Common pitfalls
- Forgetting everything is read as string -> must convert into numeric (only with `csv` module - not Pandas)
	- In Pandas:
		- If a column looks numeric, Pandas will load it as `int64` or `float64`
		- If parsing fails (mixed strings and numbers), Pandas leaves as `object` (string) -> then converted manually
- Forgetting `newline==""` when writing -> creates blank rows
- Large CSVs -> don't use `.read()`, use Pandas chunking instead