# Python Cheat Sheet
Commonly used python patterns

## Subclassing Pattern
```
# Subclassing
def Parent(object):
	def __init__(self):
		self.eyes = 2
		self.__hands = 2
		# Cannot be overriden by subclasses - Private
		self._fingers = 10 # Can be overriden by subclasses - Public but not meant to be changed
	def get_sword(self):
		return 1
		
def Cyclops(Parent):
	def __init__(self):
		super().__init__()
		self.mouth = 1
	def set_eyes(self, n):
		self.eyes = n

p = Parent()
c = Cyclops()
print(p.eyes) # returns 2
print(c.mouth) # returns 1
print(c.eyes) # returns 2
c.set_eyes(1)
print(c.eyes) # returns 1

```
