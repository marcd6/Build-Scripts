VBoxManage createvm --name "$1" --register
VBoxManage modifyvm "$1" --memory 512 --acpi on --nic1 bridged --bridgeadapter1 "en0: Wi-Fi (AirPort)"
VBoxManage createhd --filename Build-Assets/$1.vdi --size 10000
VBoxManage storagectl "$1" --name "IDE Controller" --add ide
VBoxManage storageattach "$1" --storagectl "IDE Controller" --port 0 --device 0 --type hdd --medium Build-Assets/$1.vdi