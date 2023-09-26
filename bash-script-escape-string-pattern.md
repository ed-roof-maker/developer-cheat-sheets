# Bash Cheat Sheet
Commonly used console commands.

## Escape String
```
esc_str () {
	cat - | sed 's!\\!\\\\!g' | sed 's!/!\\/!g' | sed 's!\[!\\[!g' | sed
	's!\]!\\]!g' | sed "s|\'|\\'|g" | sed 's!\>!\\>!g'
	| sed 's!\<!\\<!g' | sed
	's|\!|\\!|g' | sed 's|\"|\\"|g' | sed 's|\}|\\}|g' | sed 's|\{|\\{|g' | sed
	's|\@|\\@|g' | sed 's|\?|\\?|g'
}
```
