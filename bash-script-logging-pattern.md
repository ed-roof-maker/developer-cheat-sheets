# Bash Cheat Sheet
Commonly used console commands.

## Logging Pattern
```
# Error output on channel 2, redirect to socket &1
/usr/bin/rkhunter 2>&1 | tee /var/log/adhoc/rkhunter.log
```
