#!/bin/bash

#This script is designed to run multiple commands on all the nodes
#Target servers can be changed by using ${x2200[*]} or ${v20z[*]} arrays in place of ${all[*]}

source ./get_nodes.sh
get_nodes true;

proc="MATLAB"

cmd="
ps ax -o %cpu,comm | grep $proc
"

echo "" > tmp.proc;

for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	ssh -oStrictHostKeyChecking=no root@$ip "$cmd" | sed "s/.*/\0 $ip/" >> tmp.proc
done

sort -n -r tmp.proc;
rm -rf tmp.proc;

