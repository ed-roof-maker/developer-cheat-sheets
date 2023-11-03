# Python Cheat Sheet
Commonly used python patterns

## Writing Pandas Data Frame to Disk
```
def to_csv(df, path):
	df = df.set_index('date')
	with open(path, 'w') as w:
		w.write(df.to_csv())
	w.close()

```
