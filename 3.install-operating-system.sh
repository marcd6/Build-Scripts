#!/bin/bash
if [ -f Build-Assets/CentOS-6.5-x86_64-minimal.iso ];
then
    echo "File exists, no need to download"
else
    echo "File does not exist, downloading..."
    if [ ! -d "Build-Assets" ];
    then
        echo "Creating Build-Assets directory"
        mkdir "Build-Assets"
    fi
    curl -Lo Build-Assets/CentOS-6.5-x86_64-minimal.iso http://mirror.rackcentral.com.au/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-minimal.iso
    #curl -OL http://mirror.rackcentral.com.au/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-netinstall.iso
fi
hdiutil mount Build-Assets/CentOS-6.5-x86_64-minimal.iso
mkdir Build-Assets/tmp/
chmod 777 Build-Assets/tmp/
cp -a ks.cfg Build-Assets/tmp/
cp -a /Volumes/CentOS_6.5_Final/. Build-Assets/tmp/
chmod 777 Build-Assets/tmp/isolinux/
chmod 777 Build-Assets/tmp/isolinux/isolinux.cfg
chmod 777 Build-Assets/tmp/isolinux/isolinux.bin
cp -a isolinux.cfg Build-Assets/tmp/isolinux/
hdiutil unmount /Volumes/CentOS_6.5_Final
cd Build-Assets/tmp/
mkisofs -o ../CentOS-6.5-x86_64-minimal-kickstart.iso -b isolinux/isolinux.bin -c isolinux/boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table -R -J -v -T .
cd -
VBoxManage storageattach "$1" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium Build-Assets/CentOS-6.5-x86_64-minimal-kickstart.iso
VBoxManage startvm $1
echo "Waiting for machine $1 to finish installing..."
until $(VBoxManage showvminfo --machinereadable $1 | grep -q ^VMState=.poweroff.)
do
sleep 5
done