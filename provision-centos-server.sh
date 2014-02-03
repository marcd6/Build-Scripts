#./1.install-virtual-machine-host.sh $1
./2.create-virtual-machine.sh $1
./3.install-operating-system.sh $1
./4.remove-installation-media.sh $1
./5.boot-operating-system.sh $1