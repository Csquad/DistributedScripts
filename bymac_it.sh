#!/bin/bash

#This script is designed to run multiple commands on all the nodes
#Target servers can be changed by using ${x2200[*]} or ${v20z[*]} arrays in place of ${all[*]}

source ./get_nodes.sh
get_nodes true;

cmd="
yum -y install gcc-c++;
"
for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	echo $ip
	ssh -oStrictHostKeyChecking=no root@$ip "$cmd"
done
