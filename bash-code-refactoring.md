# Bash Cheat Sheet
Commonly used console commands.

## Code Refactoring
```find src/lib -name *.py -type f | xargs sed -i 's|from v20|from oanda.api.v20|g'```
Update python package paths.

```find src/lib -name *.py -type f | xargs sed -i 's|[TAB]|   |g'```
Change tabs to 3 spaces.

```
grep -n '\#\!' script.sh
   1:#!/usr/bin/bash
sed -i -e '1a\' -e '#\
# Author: Me 2023' script.sh
```
Add author comment after the hash bang line at line 1.

```
grep -n '\#\!' script.sh
   1:#!/usr/bin/bash
grep -n '\# Author' script.sh
   2:# Author: Me 2023
sed -i -e '2,2c\' -e '#\
# Author: You 2023' script.sh
```
Replace author comment with new value at line 2



