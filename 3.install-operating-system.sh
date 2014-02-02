curl -OL http://mirror.rackcentral.com.au/centos/6.5/isos/x86_64/CentOS-6.5-x86_64-netinstall.iso
VBoxManage storageattach "$1" --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium CentOS-6.5-x86_64-netinstall.iso
VBoxManage startvm $1