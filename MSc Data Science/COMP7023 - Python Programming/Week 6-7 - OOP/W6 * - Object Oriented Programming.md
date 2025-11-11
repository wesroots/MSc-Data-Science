---
Module: Python Programming
Week Beginning: 2025-11-10
Note Type:
  - Lecture
tags:
  - COMP7023
---
Summary
- **C5** OOP key components:
	- **Object** - bundle of attributes (data) + methods
		- `object1.func1(argument)`
	- **Class** - template describing what data/methods objects have `class Class1:`
	- **Instance** - object created from class `a = Class1("attributes")
	- **Attribute** - variable stored in an object `object.attribute`
	- **Method** - function defined within class, acting on `self`
- **C6** Implementing classes and objects (conceptual understanding of OOP overhead)
	- Object - variable that holds names and values
	- Class - template that forms the object
	- Conceptually, a dictionary can be formed to create objects from a "class" dictionary
		1. Start with template dictionary
		2. Write function to replicate dictionary, passing objects as attributes and methods
		3. Use dictionary syntax to access stored attributes and methods
- **C7** Object abstraction
	- Interface = public set of methods and behaviours an object has
	- Decided by programmer:
		- `_attribute` -> protected attribute
		- `__attribute` -> private attribute
	- Categories (bank account example):
		- Public methods: `.deposit()`, `.withdraw()`, `.get_balance()` - *included in interface*
		- Public attributes (if meant to be accessed): `.name`, `.balance` - *included in interface*
		- Private/internal attributes: `.__id`, `._cache` - *excluded from interface*
			- Helper methods such as `_is_valid()`

**Chapters 5, 6, 7**