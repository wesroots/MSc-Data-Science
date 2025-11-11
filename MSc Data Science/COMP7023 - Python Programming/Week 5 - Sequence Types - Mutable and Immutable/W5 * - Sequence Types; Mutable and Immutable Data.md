---
Module: Python Programming
Week Beginning: 2025-11-03
Note Type:
  - Lecture
tags:
  - COMP7023
---
>[!note] Lecture Notes (Post-Lecture Checklist)
>**These points were written during the lectures + seminars throughout the week to capture key ideas and actions for review - the following notes expand on checklist items through post-lecture reflection and structured consolidation**

---

# Chapter 1: Introduction
## 1. Native Data Types
**Purpose:** Native data types are building blocks of all data structures and abstractions
- Define how a info. is stored, represented, etc.
- Understanding differences (esp. mutability and precision) underpins everything in data-oriented programming
### Core types
- **Numeric** - `int`, `float`, `complex`
- **Boolean** - `True`/`False`
- **Text** - `str`
- **Collections** - `list`, `tuple`, `dict`, `set`
### Mutability
**Immutable**: `int`, `float`, `str`, `tuple`
- Can't change - new objects made for new values
**Mutable**: `list`, `dict`, `set`
- Can change in place
**Why it matters:** immutability: safety, low overhead
### Logic to note
- `bool` behaves like numbers, can control `if`/`while` logic
- `float` values are approx. -> rounding errors possible
# Chapter 2: Data Abstraction
## 2.1 Example: Rational Numbers
A rational number (e.g., $\tfrac{2}{3}$) can be can be represented as a pair of integers $\tfrac{a}{b}$ but exposed through operations rather than raw structure
## 2.2 Pairs
A pair is the simplest compound structure - usually using a tuple
- Can be built with a constructor
- Retrieve using indexes
## 2.3 Abstraction Barriers
**Purpose:** to protect programs from dependence on implementation details
- Acts as a conceptual wall between how data is represented and how it's used
### Benefits:
- Internal structure can be changed without rewriting all code
- Each layer only needs to know how to use the one below it
- Promotes modular, maintainable design
## 2.4 The Properties of Data
### Core idea
Data itself is an abstraction. E.g.:
```python
[1, 2, 3].append(4)
len("abc") # Output 4 is just an abstraction of string length
```
This concept leads directly into OOP
# Chapter 3: Sequences
## 3.1 Lists
**Purpose:** ordered, mutable sequences - they can store multiple items and be modified in place
### Properties:
- Square brackets
- Support indexing, slicing and iteration
- Can hold any data type (including other lists)
## 3.2 Sequence Iteration
**Concept:** iteration allows you to process each element of a sequence automatically
- Python abstracts away index management using `for` loops and iterators
- Generalises repeated access across all sequence types
## 3.3 Sequence Processing
**Purpose:** common operations on sequences are aggregation, transformation, and filtering
### Conceptually
- **Aggregation** -> combine values (`sum`, `len`, `min`, `max`)
- **Transformation** -> map function to each element (`map`, comprehensions)
- **Filtering** -> keep elements meeting a condition (`filter`, conditionals)
	- Ideally argument function returns a boolean, however `True` elements can return non-zero, non-empty, true
## 3.4 Sequence Abstraction
**Concept:** Python generalises lists, tuples, and strings into one sequence interface
- E.g., all sequences are:
	- Ordered
	- Support indexing
	- Support `len`
	- Support iteration
## 3.5 Strings
**Concept:** strings are immutable sequences of characters - meaning operations create new strings rather than modifying existing ones
**Why immutability matters:** can be used as `dict` keys, safer in shared contexts, predictable, less overhead
## 3.6 Trees
A tree is a hierarchical data structure made up of nodes and branches
### Conceptual view:
- Each node: a value
- Each node may contain *subtrees* (child nodes)
- Base case = a *leaf node* (no children of its own)
```python
["root", ["child1"], ["child2", ["grandchild"]]]
```
## 3.7 Linked Lists
**Concept:** A linked list is a data structure stored in linear order
- Each object has data and a pointer to the next object
![[Screenshot 2025-11-09 at 11.19.57.png]]
# Chapter 4: Mutable Data