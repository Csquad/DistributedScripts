#!/bin/bash

source ./get_nodes.sh
get_nodes true;
cmd="
	poweroff;
"
for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac


	ssh -oStrictHostKeyChecking=no root@$ip "$cmd" &

done
