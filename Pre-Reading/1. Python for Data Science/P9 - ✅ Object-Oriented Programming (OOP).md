---
Ex. Completed: true
tags:
  - python
Confidence:
---
> [!note] Tags and Links
> [[P10 - Iterators and Generators]] - iterators often implemented with OOP methods (`__iter__`, `__next__`)
>  [[P13 - Testing and Debugging]] - OOP code bases require structured testing
>  
>  #python 

# Intro
>[!note] Exercises
>- [x]  Basics -> [[OOP Basics.ipynb]]
>- [x]  Inheritance -> [[OOP Inheritance.ipynb]]
>- [x]  Dunder Methods -> [[OOP Dunder Methods.ipynb]]
>- [x]  Encapsulation -> [[OOP Encapsulation.ipynb]]
>- [x]  Abstract Classes -> [[OOP Abstract Classes.ipynb]]

## Aims
- [x] Understand what classes and objects are in Python
- [x] Learn how to use `__init__` constructor to initialise objects
- [x] Distinguish between methods (functions inside classes) and attributes (variables inside classes)
- [x] See how inheritance and polymorphism allow code reuse and flexibility
- [x] Recognise special *dunder methods* (`__str__`, `__len__`, etc.) that let objects integrate with Python's syntax
- [x] Build awareness for MSc-level projects (libraries and frameworks often use OOP internally)
## Intro
OOP is a way to structure code by combining data and the functions that act on it into one unit called an object
- Pandas and scikit-learn -> OOP heavy
	- E.g., a `DataFrame` is an object with attributes and methods
## Definitions
### Objects
- Concrete value in memory that has both:
	- State - current values of fields/attributes
	- Behaviour - methods it can execute
### Class
- User-defined type that groups together:
	- Data fields (variables) that describe something
	- Functions (methods) that operate on the data
### Attributes
- Properties that describe the object
	- Store info not actions
### Methods
- Functions that belong to the object
	- E.g., `print(df.head())` 

# Classes and Objects
## Intro
Definitions
- Class = a blueprint for an object
- Object = an instance of a class
- Attributes = variables inside the object (data)
- Methods = functions inside the class (behaviour)
>[!tip] Built-in classes
>Each variable is a reference to an object, and every object is an instance of some class:
>`"Hello"` is an instance of the built-in class `str`
>`"36"` is an instance of the built-in class `int`
>*All* built-ins follow the same pattern (`list`, `dict`, etc.)
>
>Each has its own methods (including `__str__`) that allow statements to act upon it
### Syntax
```python
class Customer:
    def __init__(self, name, income):
        self.name = name
        self.income = income

cust1 = Customer("Alice", 50000)
print(cust1.name, cust1.income)  # Alice 50000
```

## The `__init__` constructor
### Intro
- Used when arguments for the object need to be passed into attributes
```python
class Student:
    def __init__(self, name, grade):
        self.name = name     # create an attribute called name
        self.grade = grade   # create an attribute called grade

# make an object
s = Student("Alice", "A")
```
### Step by step
1. Python sees `s = student("Alice", "A")`
2. Empty `student` object created in memory
3. Calls `__init__` with arguments `"Alice"` and `"A"`
4. Inside `__init__`, those arguments are stored in the objects attributes (`self.name`,`self.grade`)
Now `s` has:
- `s.name = "Alice"
- `s.grade = "A"`
> [!note] `self`
> `self` (parameter) passes the object (argument) into the class template.
> `self.variable` is not a variable. It is an attribute of the object passed into the class.

# Inheritance and Polymorphism
## Inheritance (think family tree)
Two types of class:
- *Parent class* -> template for group of child classes
	- Defines common attributes and methods that all children have
- *Child class* -> subcategories of the parent
	- Inherit everything from parent
	- Can override some methods/attributes
> [!note] Note
> - If all methods/attributes are override, the parent class is redundant
> - Child classes are not individual objects - they are blueprints
### Simple example (syntax)
```python
# Parent Class:
class Animal:
    def __init__(self, name):
        self.name = name # shared attribute
    
    def eat(self): # shared method (NOT overridden)
        print(f"{self.name} is eating")
    
    def speak(self): # method to be overridden
        print("Some generic sound")

# Child Classes:
class Dog(Animal):
    def speak(self): # OVERRIDDEN
        print("Woof!")

class Cat(Animal):
    def speak(self): # OVERRIDDEN
        print("Meow!")

dog = Dog("Rex")
cat = Cat("Luna")

# Using them
dog.eat()     # from parent (not overridden)
cat.eat()     # from parent (not overridden)
dog.speak()   # overridden in Dog
cat.speak()   # overridden in Cat
```
## Polymorphisms
Means: many forms
- In OOP it means: same calling code (`obj.speak()`, `model.fit()`) -> different behaviour depending on the object's class
- Each class implements the same method differently
### Simple example:
```python
class Dog:
    def speak(self):
        return "Woof!" # Dog class speak() returns "Woof!"

class Cat:
    def speak(self):
        return "Meow!" # Cat class speak() returns "Meow!"

animals = [Dog(), Cat()]

for a in animals:
    print(a.speak())

# Output:
# Woof!
# Meow!
```
### Data science example
```python
models = [LinearRegression(), DecisionTreeClassifier()]

for m in models:
    m.fit(X, y)
    preds = m.predict(X)
```
- Every model in scikit-learn has `.fit()` and `.predict()`
- What happens inside is completely different (math for linear regression vs tree splitting)
## Benefits of inheritance and polymorphism
### Benefits:
1. Code reuse
	- Common attributes and methods live in the parent
	- Children reuse automatically, so you don't have to repeat code
2. Consistency
	- Parent enforces common attributes
	- All child classes will have certain methods/attributes
3. Polymorphism
	- You can write calling code that works for many classes at once, even if their implementations differ
		- E.g., `.fit(x,y)` as a method can be used on a list of different models
4. Extensibility
	- Adding a new child class automatically works with the existing system, as long as it follows parent's rules
5. Maintenance
	- If shared logic changes, you update the parent once, and all children inherit the fix
# Dunder Methods
## Intro
**Dunder** = **d**ouble **under**score (e.g., `__init__`, `__str__`)
- Special methods in Python that let your objects interact with built-in functions and operators
- Not directly user-called - Python calls automatically
## Explanation in practice
### Without print dunder method:
```python
class Book:
	def __init__(self, title, author, num_pages):
		self.title = title
		self.author = author
		self.num_poages = num_pages

book1 = Book("Harry Potter", "JK Rowling", 223)
book2 = Book("The Hobbit", "JRR Tolkien", 310)

print(book2)

# Output: <__main__.Book object at 0x104be3890>
```
### With print dunder method
```python
class Book:
	def __init__(self, title, author, num_pages):
		self.title = title
		self.author = author
		self.num_poages = num_pages

	def __str__(self):
		return f"'{self.title}' by {self.author}"

book1 = Book("Harry Potter", "JK Rowling", 223)
book2 = Book("The Hobbit", "JRR Tolkien", 310)

print(book2)

# Output: 'The Hobbit' by JRR Tolkien
```
## Custom dunder-functions links
You can create custom dunder methods to run when a function is called:
```python
class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author

    def __describe__(self):   # custom dunder (not a Python built-in one)
        return f"'{self.title}' by {self.author}"

# Custom function that looks for __describe__
def describe(obj):
    if hasattr(obj, "__describe__"):
        return obj.__describe__()
    else:
        return str(obj)

b = Book("The Hobbit", "JRR Tolkien")
print(describe(b))
```
### Steps
1. Call custom dunder (`__describe__`) in class
2. Define `describe()` function that looks for the `__describe__` attribute (method) and returns the `__describe__` result if found
	- If not found, it returns the object name
3. `describe()` can now be used to describe the object
## Common dunder methods
- `print(obj)`/`str(obj)` -> `__str__()` - human-readable string
- `repr(obj)` -> `__repr__()` - developer-readable, used in debugging
- `len(obj)` -> `__len__()`
- `for x in obj` -> `__iter__()` & `__next__()` - makes object iterable
- `obj[i]` -> `__setitem__(t)` - item assignment
- `x in obj` -> `__contains__(x)` - membership test
- `+`/`-`/`==` -> `__add__(self, other)`/`__sub__(self, other)`/`__eq__(self, other)`
	- `print(book1 == book2)`
		- `book1` is `self`
		- `book2` is `other`
- `<`/`>`/`<=`/`>=` -> `__lt__()`/`__gt__()`/`__le__()`/`__ge__()`
	- All also include `(self, other)`
# Encapsulation (optional)
## Intro
Encapsulation is controlling the access to data inside a class
### Why?
- Protects classes' internals from misuse by outside code (other programmers, libraries, or even you in the future)
### Types of encapsulation
- Public - no underscore
	- `self.name = "Alice"`
- Protected - one underscore
	- `self._grade = "A"`
- Private - two underscores
	- `self.__id = 123`
## Public (no underscore)
- Everyone can read/write it
- Considered safe to expose
```python
class Student:
    def __init__(self, name):
        self.name = name   # public

s = Student("Alice")
print(s.name)   # ✅ works
s.name = "Bob"  # ✅ you can freely change it
print(s.name)   # Bob
```
## Protected (one underscore)
- Code doesn't act differently - underscore just indicates to user:
	- "This is an internal detail, don't touch unless you know what you're doing"
- Libraries use this a lot (`df.data` in pandas)
```python
class Student:
    def __init__(self, grade):
        self._grade = grade   # protected (convention)

s = Student("A")
print(s._grade)   # ✅ works, but "internal use" signal
s._grade = "F"    # ✅ can still change it
print(s._grade)   # F
```
## Private (two underscores)
- Harder to access accidentally
- Used when you really want to discourage direct use
```python
class Student:
    def __init__(self, id_num):
        self.__id = id_num   # private (name-mangled)

s = Student(123)
print(s.__id)     # ❌ AttributeError

# Internally, Python renames it to _Student_id
print(s._Student__id)   # ✅ works (but hacky)
```
- Can still be access by syntax `s._Student__id` to prevent accidental use
## Reasons for use
1. Prevent invalid states
	- Example: bank account balance
		- If it's public, someone could do `acc.balance = -999_999` - breaks logic
			- Instead make it private and expose safe methods (`deposit`, `withdraw`) that enforce rules
2. Hide internal details
	- Don't want users depending on how it works, only what it does
	- Therefore, implementation can be changed later without breaking code
3. Reduce bugs
	- Especially in large projects or teams, direct access makes it too easy for someone to accidentally mess up object state
	- Encapsulation acts like a safety fence
# Abstract Classes (optional)
## Intro
- Cannot be instantiated on its own (instances created from it) - mean to be subclassed (child classes)
- Creating an object from a regular parent class can be incomplete
	- Abstract classes prevent incomplete objects from being created
	- Requires children to use inherited abstract methods
## Syntax example
> [!note]
> - `__init__` only has to be redefined in child class if new child attributes added
>- `from abc import ABC, abstractmethod` has to be used before defining the abstract class

```python
from abc import ABC, abstractmethod

# Abstract parent class
class Animal(ABC):
    def __init__(self, name):
        self.name = name

    @abstractmethod
    def speak(self):   # child classes MUST implement this
        pass

# Child classes
class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)   # call parent init to set name
        self.breed = breed       # child-specific attribute

    def speak(self):             # must override abstract method
        return "Woof!"

class Cat(Animal):
    def __init__(self, name, colour):
        super().__init__(name)
        self.colour = colour

    def speak(self):
        return "Meow!"

# Using them
dog1 = Dog("Buddy", "Beagle")
cat1 = Cat("Whiskers", "Black")

print(dog1.name, dog1.breed, dog1.speak())   # Buddy Beagle Woof!
print(cat1.name, cat1.colour, cat1.speak())  # Whiskers Black Meow!
```
### Steps
1. Define abstract parent class
	- Use `ABC` as function argument
	- Include common attributes in abstract `__init__` - individual attribute parameters included in child classes
	- Use `@abstractmethod` for methods that *have* to be overwritten in child classes
	- Define methods but don't include operations
2. Define child classes
	- Use abstract parent class name (`Animal`) in child class parameter
	- Include parent and child class attributes in child class `__init__` (`colour`).
	- Use `super().__init__()` to call parent's `__init__` (via `super()`) so those attributes get created inside the object
	- Define methods and operations
