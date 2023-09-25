# Bash Cheat Sheet
Commonly used console commands.

## CHROOTing a Disk
You may want to do this if you locked yourself out of pam.
You would need visudo to verify it is valid, but in a CHROOT jail.

```
fdisk -l
mkdir /mnt/tmp
cryptsetup luksOpen /dev/sda1 sda1_crypt
mount /dev/mapper/sda1 /mnt/tmp -o rw,nosuid --make-unbindable
```
Mount your locked out disk.

```for i in /dev /dev/pts /proc /sys;do sudo mount -B $i /mnt/tmp$i;done```
The above mounts your local pseudo file systems to your temp disk.

```cp /etc/resolv.conf /mnt/tmp/etc/resolv.conf```
Copy your local dns resolver to your temp disk jail.

```chroot /mnt/tmp```
Initialize your temp disk as a CHROOT jail.

```for i in /dev /dev/pts /proc /sys;do sudo umount /mnt/tmp$i; done```
Unmount your pseudo file systems.
