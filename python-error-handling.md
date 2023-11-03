# Python Cheat Sheet
Commonly used python patterns

## Error Handling Pattern
```
# Error Handling Pattern
import traceback
try:
except Exception as e:
	print(
		'Exception for job ' + job + ', ERR - \n' + str(traceback.format_exc()) +
		'\n' + str(e)
	)
	sys.exit(1)
```
