#!/bin/bash

#This script is designed to run multiple commands on all the nodes
#Target servers can be changed by using ${x2200[*]} or ${v20z[*]} arrays in place of ${all[*]}

source ./get_nodes.sh
get_nodes true;

cmd="
	nproc;
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
