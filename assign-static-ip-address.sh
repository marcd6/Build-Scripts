echo "NETWORKING=yes" > /etc/sysconfig/network
echo "HOSTNAME=$1" >> /etc/sysconfig/network
echo "GATEWAY=$3" >> /etc/sysconfig/network
sed -i s/BOOTPROTO=.*/BOOTPROTO=static/g /etc/sysconfig/network-scripts/ifcfg-eth0
echo "IPADDR=$2" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "NETMASK=$4" >> /etc/sysconfig/network-scripts/ifcfg-eth0
/etc/init.d/network restart