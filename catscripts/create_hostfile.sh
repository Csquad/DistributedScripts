#!/bin/bash

source ./get_nodes.sh
get_nodes;

cmd="
	nproc
"
for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	echo -n "$ip ";
	ssh -oStrictHostKeyChecking=no ecp8266@$ip "$cmd";
done
