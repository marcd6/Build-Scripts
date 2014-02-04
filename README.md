Build Scripts
=============

These scripts are my attempt at improving my knowledge and capabilities with continuous integration. The goal is to quickly "spin up" new flavours of servers without any manual intervention.

MILESTONE 1: Minimal server installation with dynamic IP. *This milestone was met on Feb 4, 2014. Complete process from start to finish takes around 4 minutes.*<br />
MILESTONE 2: Web server with static IP.<br />
MILESTONE 3: Continuous Integration server with static IP.<br />
MILESTONE 4: Ability to scale Continuous Integration server to multiple build agents.<br />
MILESTONE 5: Happy to take suggestions if anyone has a problem that needs solving.<br />

DISCLAIMER: I'm no Linux whizz, I'm merely a nerd that wants to learn. Feedback is extremely welcome.

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

