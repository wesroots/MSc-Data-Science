---
Ex. Completed: true
tags:
  - python
---
> [!note] Tags and Links
[[P11 - Comprehensions]] - comprehensions are shorthand loops
[[P10 - Iterators and Generators]] both expand control flow logic
> 
> #python

# Intro
>[!note] Exercises
>- [ ]  [[-- Images --/Control_Flow_Exercises.ipynb| General Exercises]]
## Aims
- [ ] Understand how Python chooses which lines of code to run using `if`, `elif`, and `else`
- [ ] Learn how to use `for` and `while` loops to repeat operations on datasets
- [ ] Apply loop control statements (`break`, `continue`, `pass`, `else`) to manage iterations
- [ ] Gain confidence writing loops for real data-science tasks (e.g., scanning rows, cleaning values)
## Intro
CF - how Python decides what to do next. In data science, this means:
- Filter/flag rows depending on conditions
- Looping through records or features to transform them
- Breaking early when a target condition is found
### Key tools:
- Decision making: `if`, `elif`, `else`
- Repetition: `for` loops, `while` loops
- Loop control: `break`, `continue`, `pass`, `else`

# Nested Conditions
## Intro
```python
# Check if a dataset entry is valid and meets loan criteria
age = 25
credit_score = 720

if age is not None:
    if isinstance(age, int):
        if age >= 18 and credit_score > 700:
            print("Eligible for loan")
        else:
            print("Not eligible")
    else:
        print("Age must be a number")
else:
    print("Missing age data")
```

# For Loops
## Intro
For looping over collections like rows in a dataset
```python
# Sum all purchases in a cart
cart_prices = [12.99, 23.50, 5.99, 10.00]
total = 0

for price in cart_prices:
    total += price

print(f"Total spend: £{round(total,2)}")
```

# While loops
## Intro
Run as long as a condition is true
```python
# Increase sample size until correlation exceeds threshold
correlation = 0.3
sample_size = 50

while correlation < 0.8:
    print(f"Sample size: {sample_size}, correlation: {correlation}")
    # pretend we recalculated correlation with more data
    correlation += 0.1
    sample_size += 50

print("Correlation threshold reached")
```

# Loop Control Statements
## Intro
- `break` -> stop loop early
- `continue` -> skip this iteration, move to next
- `pass` -> placeholder, does nothing
- `else` -> runs if loop finished without a `break`
### Example: searching data
```python
# Find first customer with negative balance
balances = [200, 150, -50, 100]

for b in balances:
    if b < 0:
        print("Warning: negative balance found:", b)
        break
else:
    print("No negative balances")
```
### Example: data cleaning loop
```python
# Replace missing values (-1) with mean
values = [10, -1, 15, 20, -1]
mean_val = sum(v for v in values if v != -1) / len([v for v in values if v != -1])

cleaned = []
for v in values:
    if v == -1:
        cleaned.append(mean_val)
        continue
    cleaned.append(v)

print(cleaned)
```

# Summary
- Control flow decides which code to run and how often
- `if/elif/else` = decision making
- `for` and `while` = repetition
- Loop controls (`break`, `continue`, `pass`, `else`) fine-tune iterations
- In data science -> control flow used for filtering, scanning, cleaning and checking conditions across datasets
