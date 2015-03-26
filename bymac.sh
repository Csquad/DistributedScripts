#!/bin/bash

ip neigh flush all;
for (( i=1; i<=255; i++ ))
do
	ping -c 1 192.168.1."$i" > /dev/null 2>&1 &
done

x2200=(`arp -n | egrep '00:1b:24|00:16:36' | egrep -o '192\.168\.1\.[0-9]*'`)
v20z=(`arp -n | egrep '00:09:3d' | egrep -o '192\.168\.1\.[0-9]*' | egrep -v '192.168.1.1$'`)
all=(${x2200[*]} ${v20z[*]})

echo "X2200 running: "${#x2200[*]};
echo "v20z running: "${#v20z[*]};

echo "total running: "${#all[*]};

cmd="
	poweroff;
"
for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac


	ssh -oStrictHostKeyChecking=no root@$ip "$cmd" &

done

#ssh-copy-id -oStrictHostKeyChecking=no root@"$ip";

#find /etc/sysconfig/network-scripts/ -name "ifcfg-enp*" -print | xargs sed -i '$ a\ETHTOOL_OPTS="wol g"\nPERSISTENT_DHCLIENT=1';

#scp ./network_failsafe.sh root@"$ip":/network_failsafe.sh;
#chmod +x /network_failsafe.sh;
#crontab -l > mycron;
#echo "* * * * * /network_failsafe.sh" >> mycron;
#crontab mycron;
#rm mycron;
