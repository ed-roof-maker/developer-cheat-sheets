# Python Cheat Sheet
Commonly used python patterns

## Run Bash Shell Commands
```
import subprocess
process = subprocess.Popen('cat /proc/sys/kernel/random/entropy_avail', stdout=subprocess.PIPE, shell=True, encoding='utf8')
entropy_pool=int(process.communicate()[0][:-1])
# no return with long timeout
process.communicate(timeout=9999999)
```
