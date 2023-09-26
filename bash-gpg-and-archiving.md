# Bash Cheat Sheet
Commonly used console commands.

## GPG Fix After SELinux Enablement
```ps -ef | grep gpg-agent```
Check running processes.

```kill -9 <pid>```
Kill the gpg agent.

```semanage login -l```
Check if current session user has adequate MAC user label staff_u

```
# Make sure all files have gpg_secret_t
ls -lrtahZ .gnupg

# Make sure all files can be written to
chmod 600 .gnupg/*

# Prevent private key generation once done
chmod 400 .gnupg/{random_seed,secring.gpg}
```
Check if gnupg home dir is correctly MAC labeled and has proper DAC permissions.

```tail cat /var/log/messages | grep avc | grep gpg | less```
Check for MAC AVC denials and create an selinux module if you need to.
Ideally you should create your own policy labels for any custom binary restriction rules.
Modifying a base domain type label opens up restrictions for multiple binaries instead of just your problematic one.

```7z -a <file>```
Add file to zip.

```7z -x <file>```
Extract 7x contents.

```
zip -q9r tools.zip *
unzip tools.zip
```
Zip all files in the current folder recursively and with the best compression.
Be quiet!

```tar --xz -cf myfiles.tar.xz ./documents```
Compress documents folder as myfiles.tar.xz.

```tar -xf myfiles.tar.xz```
Extract myfiles.tar.xz to current working directory.

```
gpg --version
gpg --symmetric --force-mdc --cipher-algo TWOFISH myfiles.tar.xz
```
Encrypt myfiles.tar.xz symmetrically with a passphrase using TWOFISH cipher.

```
gpg --version
gpg --list-keys
  pub 4096R/1234ABCD 2021-10-23
  uid Donald (don@me.me)
gpg --default-key “Donald” --recipient “Donald” --sign --encrypt myfiles.tar.xz
ls *
  myfiles.tar.xz.gpg
```
Using the previous TWOFISH encrypted file, we use Donald’s default private key to sign and encrypt, so that his public key can be used by a recipient to verify integrity.

```gpg myfiles.tar.xz.gpg```
Decrypt file.

```gpg --list-keys```
List keys for current user’s keyring.

```gpg --fingerprint 1234FABC```
List the finger print for key ID.

```gpg --gen-key```
Generate a private key for the current user.

```
gpg --sign-key security@centos.org
gpg –edit-key security@centos.org
gpg> trust
gpg| trust> 5
gpg| trust ok y/n> y
gpg> q
```
Sign a public key inside user key ring, with user’s private key.




