# Bash Cheat Sheet
Commonly used console commands.

## File System Searching
### Globbing
```
ls -l t?.sh
ls -l [ab]*
ls -l [a-c]*
ls -l [^ab]*
ls -ls [b*,c*,*est*]
```
### Regular Expressions
```grep -r 'hello' /home/user```
Recursive grep example.

```find src/lib -name *.py -type f | xargs sed -i 's|[TAB]|   |g'```
Change tabs to 3 spaces.

