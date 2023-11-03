# Python Cheat Sheet
Commonly used python patterns

## Pandas Custom Rolling Window Pattern
```
def get_rolling_method(x)
	# Rolling sum
	row_val = x['value'].sum()
	effective_date = x['date'].tail(1).values[0]
	return {'date': effective_date, 'value': row_val}
	
value_list_df = ...
window = 62
metric_list = []
gr_df = get_growthrate(value_list_df[['date', 'value']])
metric_list = [ get_rolling_method(x) for x in gr_df.rolling(window + 1) ]
df = pd.DataFrame(metric_list)
```
