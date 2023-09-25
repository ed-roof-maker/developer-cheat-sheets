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

```
CTRL+v
<up><down>
d
```
Uncomment example. Enters into visual block mode so you can select vertical text.
Pressing d will delete the block of text.

### Navigating Text
```:/<string>```
Search for string.

```gg```
In VIEW mode go to top of file.

```SHIFT+g```
In VIEW mode go to the bottom of file.

```w```
In VIEW mode move one word to the right.

```b```
In VIEW mode move back one word to the left.

```CTRL+w+h```
Move cursor to left pane.

```CTRL+w+l```
Move cursor to the right pane.

```CTRL+w+j```
Move cursor to the bottome pane.

```CTRL+w+k```
Move cursor to the top pane.

```:help window-move-cursor```
Help for moving around view ports.

### Configuring VIM
```
:set nonumber
:set number
```
Turn on/off line numbering.

```
:set nospell
:set spell
```
Turn on/off spell check.

```:spell NewWord```
Add NewWord to the spell check dictionary.

```:syntax on```
Turn on syntax highlighting.

```:retab```
Change all tabs in the current file to the defaults in .vimrc.

### VIM .vmrc
```:set number```
Show line numbers.

```:setlocal cm=blowfish2```
Set cipher when saving with :X.

```
:set colorcolumn=100
:set winwidth=102
:set winminwidth=100
```
Show a 100 character wide column vertical line.

```:syntax off```
Do not show syntax by default.

```
:set tabstop=3
:set shiftwidth=3
:set expandtab
```
Set tabs to 3 spaces by default.

```:hi Normal ctermbg=black```
In a terminal emulator with transparent background, you may want vim to not be transparent because it will affect syntax highlighting and look dim and dull.
