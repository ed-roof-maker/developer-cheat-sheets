# Bash Cheat Sheet
Commonly used console commands.

## Exporting a QCOW2 Virtual Disk to Another Device
```
ulimit -f unlimited
qemu-img convert -O raw /vmrlab/vmstorage/disk.qcow2 /tmp/tmp.img
dd if=/tmp/tmp.img of=/dev/sdb bs=6G status=progress
```

## Shrinking a QCOW2 Virtual Disk to fit in a Physical Disk
When disk dumping a 250G pre massaged image onto a SSD, it would be necessary to shrink it if it is too large to dump to a physical device.

```qemu-img convert -O raw RlabOS-RLIC-v1-0.qcow2 RlabOS-RLIC-v1-0.img```
Convert to raw image as another copy so we can shrink it.
Boot a VM with a live disk containing disk tools such as ubuntu and gparted.
Make sure the target disk has free space.
This can be done by shrinking the boot partition and shifting all partitions to the left.
This results in free disk space to the right.

```qemu-img resize RlabOS-RLIC-v1-0.img -1G```
Now that the raw img virtual storage disk has free space to the right.
We can shrink it.

```dd if=RlabOS-RLIC-v1-0.img of=/dev/sdc status=progress bs=6G```
Now we can disk dump.
Towards the end of the dump we should ignore any dump errors that suggest not enough space on device.
The remaining data was removed in the previous step, but the partition table still showed a larger size.
We should modify this partition table on the device so that it reflects the real device size.
This is done in the next step.

```
fdisk /dev/sdc
Command: p # For menu
Command: v # To verify partition table
Total allocated sectors 493582336 greater
than the maximum 488397168.
Command: O # Uppercase oh output part table
back.txt
vi back.txt
... label: dos
... /dev/sdc3: size=491532288
... /dev/sdc3: size=488397169 # Change +1
fdisk /dev/sdc
Command: I # Uppercase eye input part table
back.txt
Command: w # Write loaded part table to disk
```
Even though in the previous step we did not getany errors.
The partition table on the disk has a recorded end sector that is larger than the physical limit.
The new raw img needs to be edited using fdisk and have the last partition shrunk to below the physical limit.
Add 1 sector to the size, otherwise it will be too small.
We then need to reinstall the partition table once we finish modifying it.
We must make sure we write our modified partition table back to the disk.

