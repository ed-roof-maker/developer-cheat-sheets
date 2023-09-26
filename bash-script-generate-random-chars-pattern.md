# Bash Cheat Sheet
Commonly used console commands.

## Generate Random Printable Characters
```
get_devrand () {
tr -cd "[:graph:]" < /dev/random | head -c 255
}
```
