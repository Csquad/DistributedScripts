#!/bin/bash

#This script is designed to run multiple commands on all the nodes
#Target servers can be changed by using ${x2200[*]} or ${v20z[*]} arrays in place of ${all[*]}

source ./get_nodes.sh
get_nodes true;

cmd="
killall MATLAB;
"
for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	ssh -oStrictHostKeyChecking=no ecp8266@$ip "$cmd" &
done

killall MATLAB;
