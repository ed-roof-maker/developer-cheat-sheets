# Bash Cheat Sheet
Commonly used console commands.

## Vim Shortcuts
### Working with Files
```:vsplit <filepath>```
Split screen vertically and open new file.

```:split <filepath>```
Split screen horizontally and open new file.

```:sview <filepath>```
Split screen horizontally and open read only.

```:q!```
Force quit.

```:w!```
Force save

```:X```
Save with encryption

### Handling Text
```i```
From VIEW mode, change to INSERT mode.

```dd```
Delete / cut to clipboard in VIEW mode.

```v```
In VIEW mode change to VISUAL mode.

```y```
In VISUAL mode yank the data to the clipboard.

```p```
In VIEW mode paste the data.

```:s/redhat/RedHat/g```
Find and replace example.

```:3,6>>>```
Between lines 3 and 6 multi line indent 3 times to the right.

```:3,6<<```
Indent 2 times to the left.

```
CTRL+v
<up><down>
SHIFT+i
#
```
Multi line comment example with hash. Enter visual block mode and select lines using cursor.
Press SHIFT+i to insert then select the character. In this case it is hash.


