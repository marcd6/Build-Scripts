Build-Scripts
=============

1.install-virtual-machine-host.sh
---------------------------------
Downloads (if necessary) and installs VirtualBox 4.3.6 (Build 91406) into /Volumes/Macintosh HD on OSX.

USAGE: ./1.install-virtual-machine-host.sh

2.create-virtual-machine.sh
---------------------------
Creates a named VM with 512mb RAM in VirtualBox with networking bridged to Wi-Fi (AirPort) and attaches a 10Gb disk image (.vdi). Disk image is placed in Build-Assets/ folder.

USAGE: ./2.create-virtual-machine.sh test.localhost

3.install-operating-system.sh
-----------------------------
Downloads CentOS 6.5 (if necessary), merges .iso with Kickstart file to enable unattended install, runs installation in specified VM, then shuts down.

USAGE: ./3.install-operating-system.sh test.localhost

