# Python Cheat Sheet
Commonly used python patterns

## Pandas Common Selections
```
# Values
a = {'v': [1,2,3,4,5]}
df = pd.DataFrame(a)

# AND
mid = df[(df['v'] > 2) & (df['v'] < 4)]

# OR
bounds = df[(df['v'] == 2) | (df['v'] == 4)]

# Strings
b = {'v': ['apple','cat','dog','mouse','banana']}
df = pd.DataFrame(b)

# CONTAINS - ISIN
words_with_a = df[df['v'].str.contains('a')]
words_with_a = df[df['v'].str.startswith('ap')]
words_with_a = df[df['v'].str.endswith('e')]

# Find – regex pattern
words_with_a = df[df['v'].str.findall('^app.*le$')]

```
