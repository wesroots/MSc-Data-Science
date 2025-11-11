---
Ex. Completed: false
Confidence:
tags:
  - "#python"
Links: "[[P11 - Comprehensions]]"
---
> [!note] Topic Overview
> - Iterators and generators are Python tools for handing sequences one at a time
> 	- Allow efficient memory usage, especially for large datasets or infinite sequences - instead of loading all at once, values are produced on demand
> - Data Science
> 	- Useful for streaming data, processing large CSVs, creating reproducible pipelines without memory-blow up

# Iterators (`iter()` and `next()`)
## Intro - definition and process
- Iterator - an object that represents stream of data, returning elements one at a time
- Iterable - an object you can loop over (lists, tuples, strings)
### How does it work?
`iter(obj)` -> gets an iterator from an iterable
`next(it)` -> returns the next element, raises `StopIteration` at the end
### Syntax/example
```python
nums = [1, 2, 3]
it = iter(nums)
print(next(it))  # 1
print(next(it))  # 2
print(next(it))  # 3
# next(it) would now raise StopIteration
```
