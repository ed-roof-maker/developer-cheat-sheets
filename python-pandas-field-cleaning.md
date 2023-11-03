# Python Cheat Sheet
Commonly used python patterns

## Pandas Field Cleaning Patterns
```
def clean_value_df_col_helper(v):
	x=v
	if type(x) == str:
		x = x.replace("'..'", "").replace('".."', '')
		x = x.replace("'.'", "").replace('"."', '')
		x = x.replace("'-'", "").replace('"-"', '')
		x = x.replace("'--'", "").replace('"--"', '')
		x = x.replace("--", "").replace('..', '')
		x = x.replace("'.'", "").replace('"."', '')
		x = x.replace('"', '').replace("'", "")
		x = x.replace(' ', '').replace(' ', '').replace(',', '').replace('$', '').replace('%', '')
		if x.__len__() == 1:
			x = x.replace('.', '').replace('-', '').replace(' ', '')
		try:
			if x != '':
				return float(x)
			else:
				return np.nan
		except Exception:
			print(
				'WARNING: Returning NAN | Data frame string column value ' + str(v) +
				', could not be converted to a float via the cleaned value of ' + str(x)
			)
		return np.nan
	elif type(x) == complex:
		try:
			x = F().from_float(x.real)
			return x
		except Exception:
			print(
				'WARNING: Returning NAN | Data frame complex column value ' + str(v) +
				', could not be converted to a Fraction via the cleaned value of ' + str(x)
			)
		return np.nan
	else:
		try:
			return float(v)
		except Exception:
			print(
				'WARNING: Data frame col type of ' + str(type(x)) + ', with column value ' + str(v) +
				', could not converted to a float.'
			)
		return np.nan
```


```
def clean_value_df_cols(df_in, col):
	try:
		df = df_in.copy()
		# Filter
		df = df.dropna()
		df[col] = df[col].apply(lambda x: clean_value_df_col_helper(x))
		df = df.dropna()
		# Convert
		df[col] = df[col].astype(float)
		return df
	except Exception:
		print(
			'ERROR: Could not clean col ' + col + '. Skipping. Field type is ' +
			str(type(df[col].values[0])) +
			' | Dataframe source sample is - \n ' + df_in.tail(5) +
			'\n Value of attempted cleaned column array series as str is - ' +
			str(df[col].values)
		)
		return False
```
