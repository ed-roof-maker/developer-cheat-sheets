# Bash Cheat Sheet
Commonly used console commands.

## Burning ISOs
Sometimes it is easier to manually backup to optical.

```genisoimage -allow-limited-size -udf -iso-level 4 -J -joliet-long -volid "myfolder" myfolder.iso ./myfolder```
Create an iso image called myfolder, located in ./myfolder.

```wodim dev=/dev/cdrom speed=2 fs=128m driveropts=burnfree blank=fast```
Blank the DVD-RW medium.

```wodim dev=/dev/cdrom speed=2 fs=128m driveropts=burnfree -data /tmp/myfolder.iso```
Burn the generated ISO to optical.

```
mount /tmp/myfolder.iso /mnt/temp1
mount /dev/cdrom /mnt/temp2
diff -dur /mnt/temp1 /mnt/temp2;echo $?
```
Verify the burnt medium with the generated iso.
Eject and reinsert optical medium before verifiying.
This should return 0 and no differences.
