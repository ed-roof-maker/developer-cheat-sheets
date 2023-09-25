# Bash Cheat Sheet
Commonly used console commands.

## Mounting Securely
```cryptsetup luksOpen /dev/sda1 sda1_crypt```
Decrypt luks device.

```mount /dev/mapper/sda1_crypt /mnt/temp -o rw,nodev,nosuid,sync,noexec --make-unbindable```
Mount the volume as read write.

```mount /dev/mapper/sda1_crypt /mnt/temp -o ro,nodev,nosuid,sync,noexec --make-unbindable```
Mount the volume as read only.

```
e2fsck -fy /dev/sdb1
id boxcode1
   boxcode1=(uid=1008)
mount /dev/sdb1 /mnt/temp1 -o rw,nodev,nosuid,noexec,uid=1008,umask=077 –-make-unbindable
ls -lrtah /mnt/temp1
   /mnt/temp1
   rwx------ boxcode1:root .
```
How to properly mount an exfat/fat volume and assign it a unix user ID.




