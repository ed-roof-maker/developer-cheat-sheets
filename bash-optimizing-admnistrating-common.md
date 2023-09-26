# Bash Cheat Sheet
Commonly used console commands.

##Check Random Entropy Pool
```
# Check random entropy pool
cat /proc/sys/kernel/random/entropy_avail
```

## Check Machine Swapiness
```
# Check machine swapiness
cat /proc/swap
swapon --summary
# Optimise for file access
swapon -a -p 99
# Optimise for application daemons
swapon -a -p 0
```

## Check CPU Power Saving
```
# Check CPU power saving
cat /sys/module/intel_idle/parameters/max_cstate
```

## Check Shared Memory
```
# Check shared memory
mount | grep tmpfs
du -h -d 1 /dev/shm
```

## Optimizing Libre Of fice
```
# Check the temp folder locations
ls -lrtah ~/.config/libreoffice/4/user
temp/ backup/ ...

# Create new location in shared memory
mkdir /dev/shm/libreoffice
mkdir /dev/shm/libreoffice/temp
mkdir /dev/shm/libreoffice/backup

# Create the symbolic links
cd ~/.config/libreoffice/4/user
rm -fr temp backup
ln -s /dev/shm/libreoffice/temp .
ln -s /dev/shm/libreoffice/backup .
ls -lrtah
backup -> /dev/shm/libreoffice/backup
temp -> /dev/shm/libreoffice/temp
```

## Checksum Examples
```echo ‘DonaldTrump’ | sha512sum```
View the text as a sha512 hash

```gpg --verify repomd.xml.asc repomd.xml```
Gpg verify the gpg signature.

## RPM Package Verification
```rpm -V coreutils```
Check if rpm package is installed properly.

```rpm --checksig coreutils```
Verify the gpg signature within the rpm.

```rpm -qa gpg-pubkey*```
Lists all public keys installed in the rpm db.

```rpm -qi gpg-pubkey-db42a60e```
List information about the installed public key in the rpm db.
 
```rpm -e gpg-pubkey-db42a60e```
Erase gpg key from rpm db.

```rpm --import RPM-GPG-KEY-*```
Import a public gpg key to the rpm db.

## RPM Local Repo Verif ication
```gpg --verify repomd.xml.asc repomd.xml```
Gpg verify the repomd meta data.

```
cd ../;ls
Packages .. .
rpm --checksig Packages/*/*.rpm > rpm-sig.out
grep rpm-sig.out | grep OK | wc -l
grep rpm-sig.out | grep ".rpm:" | wc -l
```
Verify the rpm’s gpg signature within the packages.
Do this in bulk using the rpm tool.

## RPM Local Repo Package Update
```
mv myrpm/*.rpm Packages/
chmod -R 700 Packages/
```
Install new set of rpms into the Package repo folder.

```
yum install createrepo
cd updates-repo
yum clean all
yum repolist
ls Packages/repodata
rm -fr Packages/repodata
```
Install createrepo.
Observe the repo package count baseline.
Remove old repodata.

```
createrepo --update Packages
chmod -R 700 Packages/
yum clean all
yum repolist
```
Generate a new repodata index.
Observe the new repo package count.
Compare it with the previous baseline.

## RPM Common Tasks
```rpm -ql coreutils```
List target OS file paths for this rpm package.

## Printing From Linux
```rpm -ql coreutils```
List target os file paths for this rpm package.

```lpstat -t```
Show all printer info.

```lpstat -d```
Show default printer.

```lpstat -o```
Display print jobs.

```cat cheatsheet.txt | pr -h "Linux Cheat Sheet" > printjob.txt```
Format text file.

```
lp -d myprinter \
-o media=a4 -o portrait -o sides=two-sided-long-edge \
-o fit-to-page,number-up=4 \
printjob.txt
```
Print page.

```lpstat -o```
Display print jobs.

## Common Linux Commands
```sestatus```
SELinux status.

```setenforce 1```
Enable selinux.

```getsebool | grep *guest*```
Get any se booleans from guest users.

```semanage login -l```
List selinux users and their context labels.

```semanage login -s -u guest_u e```
Set user e to selinux guest_u confined context.

```iptables -L```
List kernel firewall rules.

```iptables --flush```
Removes existing rules.

```iptables-restore -w 120 < /path/to/rules.dump```
Restore saved rules.

```find / -name limits.conf```
Find file name in all locations of root path.

```getfacl /home/admin_sec```
Get default dac permissions for the folder.

```setfacl -d -m u::rw- /home/admin_sec```
Set rw- permissions for newly created files under this folder.

```setfacl -m u::rwx /home/admin-sec```
Set folder permissions.

```setfacl -b /home/admin-sec```
Set default acl permissions.

```lsattr limits.conf```
List extended file system attributes.

```chattr +i limits.conf```
Set the extended immutable attribute to the file.

```chattr -i limits.conf```
Remove the extended immutable attribute.

```diff -u file1 file2```
Compare two text files.

```
mount /mnt/temp1 /mnt/temp2
diff -dur /mnt/temp1 /mnt/temp2
```
Compare the contents of two mounted storage devices at a binary level.
Exits 1 if there are differences or errors.

```
find /tmp/ -type f | xargs shred --zero --force --remove
find /tmp/ -type d | xargs rmdir
```
Secure file delete by overwriting file locations with zeros.


```
find /tmp/ -type f | xargs scrub -p nnsa --remove
find /tmp/ -type d | xargs rmdir
```
Secure file delete by using highest industry standard.





