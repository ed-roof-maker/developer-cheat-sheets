# Bash Cheat Sheet
Commonly used console commands.

## Loop Through File Lines Pattern
```
cat /etc/sudoers.d/custom | while read -r line
do
echo 'LINE: '$line
done
```


