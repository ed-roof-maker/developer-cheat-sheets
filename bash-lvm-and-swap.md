# Bash Cheat Sheet
Commonly used console commands.

## Using Logical Volumes
```lvmdiskscan```
Show all system block devices that lvm can use.

```pvscan```
Show all lvm physical volumes.

```vgscan```
Show all lvm volume groups.

```lvscan```
Show all lvm logical volumes.

```pvcreate /dev/sda /dev/sdb```
Create lvm physical volumes out of system block devices.

```vgcreate rlic /dev/sda /dev/sdb```
Create rlic lvm group and add lvm physical volumes to it.

```lvcreate -L 10M -n systemd rlic```
Create SystemD lvm volume and add it to rlic lvm group.

```mkfs.xfs /dev/rlic/systemd```
Format SystemD lvm volume as xfs.

```lvextend -L 5G /dev/rlic/var```
Extend volume by 5G.

```xfs_growfs -d /dev/rlic/var```
Grow xfs filesystem to its maximum.

```lvcreate --snapshot --name sys-bk --size 5G /dev/<vg>/sys```
Create snapshot from sys volume.

## LVM Live Resize - Shrink and Expand
Sometimes it is necessary to do a live online lvm resize.
In this example we take space from var and give it to root disk.
This can be done live.
```
lvresize --test --resizefs --extents -100M /dev/mapper/vg/var
lvresize --resizefs --extents 100M /dev/mapper/vg/var
lvresize --test --resizefs --extents +100%FREE /dev/mapper/vg/sys
lvresize --resizefs --extents +100%FREE /dev/mapper/vg/sys
```

## Steal LVM Space From Swap and Give to Root
```
swapoff
lvreduce --test --resizefs --size 100M /dev/mapper/vg/swap_1
lvreduce --resizefs --size 100M /dev/mapper/vg/swap_1
mkswap /dev/mapper/vg/swap_1
swapon -a
lvresize --test --resizefs --extents +100%FREE /dev/mapper/vg/root
lvresize --resizefs --extents +100%FREE /dev/mapper/vg/root
```

## Check Machine Swapiness
```
cat /proc/swap
swapon --summary
```
Check the swapiness.

```swapon -a -p 99```
Optimize for file access.

```swapon -a -p 0```
Optimize for application daemons.

## Expanding a Small Filesystem Inside a Large Disk
When disk dumping a 250G pre massaged disk onto a blank 500G, it would be necessary to expand the filesystem so that it detects the physical 500G total size.

```dd if=/dev/sda of=/dev/sdb status=progress bs=6G```
Clone the small 250G disk onto a larger 500G disk.

```
fdisk /dev/sdb
:fdisk> w
```
We open the disk and select w to rewrite the partition table metadata.
This enables the disk to be seen as 500G instead of 250G.

```GUI – gparted – extend the last partition of the sdb disk, eg sdb3```
We use the gparted gui the extend the last partition to 500G.

```
cryptsetup luksOpen /dev/sdb3 sdb3_crypt
cryptsetup resize /dev/mapper/sdb3_crypt
```
In this example we decrypt the luks device and perform a live resize.

```
pvdisplay
pvresize /dev/mapper/sdb3_crypt
pvdisplay
```
Resize the lvm physical volume.

```vgdisplay```
Record the volume group’s free space.

```lvextend --size +237G /dev/<vg>/public```
We extend our desired volume group by 237G so that our new 500G disk gets fully maximised.

```
e2fsck -f /dev/<vg>/public
resize2fs /dev/<vg>/public
e2fsck -f /dev/<vg>/public
```
We check our volume for any filesystem errors, then we perform a filesystem resize.
We make sure there are still no filesystem errors once resizing is finished.


