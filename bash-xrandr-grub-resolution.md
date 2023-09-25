# Bash Cheat Sheet
Commonly used console commands.

## XRandr and Grub Console Resolution
```xrandr --output HDMI-1 --mode 1920x1080i --scale 1x1 --rate 30.00```
Sets the resolution to 1080i but with half the refresh rate at 30Hz.

```echo "GRUB_GFXMODE=1920x1080" | sudo -r sysadm_r tee --append /etc/default/grub```
Configures grub to 1080p upon boot up. Recompile grub for your distribution.

