#!/bin/bash
if [ -f Build-Assets/VirtualBox-4.3.6-91406-OSX.dmg ];
then
    echo "File exists, no need to download"
else
    echo "File does not exist, downloading..."
    if [ ! -d "Build-Assets" ];
    then
        echo "Creating Build-Assets directory"
        mkdir "Build-Assets"
    fi
    curl -Lo Build-Assets/VirtualBox-4.3.6-91406-OSX.dmg http://download.virtualbox.org/virtualbox/4.3.6/VirtualBox-4.3.6-91406-OSX.dmg
fi
hdiutil mount VirtualBox-4.3.6-91406-OSX.dmg
sudo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target "/Volumes/Macintosh HD"
hdiutil unmount /Volumes/VirtualBox