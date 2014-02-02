#wget http://download.virtualbox.org/virtualbox/4.3.6/VirtualBox-4.3.6-91406-OSX.dmg
curl -OL http://download.virtualbox.org/virtualbox/4.3.6/VirtualBox-4.3.6-91406-OSX.dmg
hdiutil mount VirtualBox-4.3.6-91406-OSX.dmg
sudo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target /Volumes/HD
hdiutil unmount /Volumes/VirtualBox
rm VirtualBox-4.3.6-91406-OSX.dmg