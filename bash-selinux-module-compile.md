# Bash Cheat Sheet
Commonly used console commands.

## SELinux Module Compile Example
```
# Install sepolicy dev tools
yum install policycoreutils-devel

# Copy foundry’s semodules into system temp.
cp -fr $RLAB/mac-targeted/sepolices /tmp/

# Use sepolgen tool to create the initial policy for your target app.
sudo mkdir /tmp/sepolicies/xfce4-panel-rlab
sudo bash -c “cd /tmp/sepolicies/xfce4-panel-rlab; sepolgen --application /usr/bin/xfce4-
panel”

# Set permissions for blacksmith session.
chown -R blacksmith:users /tmp/sepolices
chmod -R 700 /tmp/sepolicies

# Log into blacksmith session and setup your module boilerplate.
blacksmith:> cd /tmp/sepolicies/xfce4-panel-rlab
blacksmith:> vim xfce4-panel-rlab.te
...Check if any rules do not make sense. Scan syslog for any avc deny errors.
...Allow if it is safe to do so without opening too much of a door way.
...Replace outdated application_domain() function with files_type() otherwise compile will
fail.

# Example *.te file
policy_module(local, 1.0)
require {
   attribute httpdcontent;
   type smbd_t;
}
allow smbd_t httpdcontent:dir create_dir_perms;
allow smbd_t httpdcontent:{ file lnk_file } create_file_perms;

# When ready to compile use the selinux make file
make -f $SEDEV/Makefile
Compiling targeted local module
/usr/bin/checkmodule: loading policy configuration from tmp/local.tmp
/usr/bin/checkmodule: policy configuration loaded
/usr/bin/checkmodule: writing binary representation (version 5) to tmp/local.mod
Creating targeted local.pp policy package
rm tmp/local.mod.fc tmp/local.mod

# When cycling through failure we must be in permissive mode and use audit2allow for
enrichments
# We can do this manually below -
setenforce 0
cd /tmp/discoveries
cat /var/log/messages | grep xfce4-panel | audit2allow -M xfce4-panel-rlab
cat xfce4-panel-rlab.te | tee --append /tmp/sepolicies/xfce4-panel-rlab/xfce4-panel-
rlab.te

# We then compile the above changes once we have refined the rules.
# Or use SEPolGen’s auto generated script. Refactor the script for name changes -
vim xfce4-panel-rlab.sh
...perform refactoring if any labels were renamed
...remove ausearch and replace with the previous examples’s cat grep and audit2allow
...remove references to manual generation
vim xfce4-panel-rlab.spec
...remove references to manual generation
...refactor so that rpm name is what you desire it too look like

# Below will scan /var/log/messages and append any new rules to *.te files
bash xfce4-panel-rlab.sh --update
# Below will compile and install the new module
bash xfce4-pane-rlab.sh
restorecon -F -R /etc /usr
```
