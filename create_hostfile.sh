#!/bin/bash

source ./get_nodes.sh
get_nodes;

cmd="
	nproc
"
for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	echo -n "$ip slots=";
	ssh -oStrictHostKeyChecking=no root@$ip "$cmd";
done
