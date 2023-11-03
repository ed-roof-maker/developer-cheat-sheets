# Python Cheat Sheet
Commonly used python patterns

## Pandas Custom GroupBy Window Pattern
```
def get_end_of_period_method(x)
	# End of Week Sum
	row_val = x['value'].sum()
	effective_date = x['date'].tail(1).values[0]
	return {'date': effective_date, 'value': row_val}
	
value_list_df = ...
metric_list = [
	get_end_of_period_method(df) for i, df in value_list_df.set_index(
		'date'
	).groupby(pd.Grouper(freq='W'))
]
```
