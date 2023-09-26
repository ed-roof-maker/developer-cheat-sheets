# Bash Cheat Sheet
Commonly used console commands.

## Working with Strings
```
minator=/bin/hostname
bin=/bin
echo "$minator"
> /bin/hostname
echo $($minator)
#
> mydesktop.lan
# Evaluates the variable into an evaluator string type
# Opens mini shell executes hostname command echos the results to standard out

HOME_PATH='/home/admin_sec'
BAD_PATH='/ho me/admin_sec'
# Script global constant

if [ "$1" == '--yes' ]# Condition constant
ls $HOME_PATH'/todo.txt'# Two variables with string immutable string type
ls $bin/'whoami'
# A variable path type with an immutable string

ls $BAD_PATH
# Use no quotes to expand as multi args separated by spaces
> Error /ho not found
> Error me/admin_sec not found

ls "$BAD_PATH"
# Use double quotes for variable to expand as one argument
> Error /home/admin_sec not found
```

```
P=$1
# Path from input arg
cmd='chmod 700'
${cmd} ${P}
ec=$?
echo 'Exit Code: '${ec}
```
String into command example.
