# Python Cheat Sheet
Commonly used python patterns

## Dictionary Manipulation
```
# Modifying a dictionary
a = {'a':1, 'b':2}
a.update({'c':3})

# Looping through a dictionary
for key in a.keys():
	print(a[key])

# Checking for key existence
if 'c' in a.keys():
	print(a['c'])
```
