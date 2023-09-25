# Bash Cheat Sheet
Commonly used console commands.

## Screen Shortcuts and Config
```screen -L```
Log actions to home directory.

```screen -ls```
List screen instances.

```screen -d -r <pid>```
Detach and then retach screen for process id.

```CTRL+a+x```
Lock the session console.

```cat /etc/screenrc ~/.screenrc```
Use the system template for reasonable defaults.

```idle 60 lockscreen```
Add line to ~/.screenrc to auto lock after 60 seconds.

```layout autosave on```
Add line to ~/.screenrc to auto save screen regions.


## Screen Coding Session Sequence
If coding in a headless terminal, you'd want to memorize the below.

```
screen -S “Dev Unit Testing”
screen -ls
screen -X layout new
```
Creates a named session with a new layout.

```CTRL+a, SHIFT+|```
Keep splitting the screen into regions, left and right.

```CTRL+a, SHIFT+S```
Keep splitting the screen into regions, up and down.

```CTRL+a, TAB```
Move to the next split region

```CTRL+a+c```
Create a new window (sub session), within the current
region.

```CTRL+a, SHIFT+“```
Show a list of open windows (sub sessions). Select the one you want to move into.

```CTRL+a, SHIFT+A```
Rename the current window (sub sessions).

```CTRL+a, 1..9```
Move directly to window number X within the current screen region.

```
screen -X sessionname “Dev Feature Building”
screen -ls
```
Rename the current session to the new label.

```
screen -X layout autosave on
screen -X layout save 1
CTRL+a+x
```
Save the current screen region layout.
Test that the layout is restored by locking the screen, and logging back in.

```screen -X password```
Sets a reattach password so other sessions cannot steal it, and so root user cannot steal it.
This option prevents session renaming and any other command via the -X flag.
Password is stored in memory.
