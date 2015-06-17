#!/bin/bash

source ./get_nodes.sh
get_nodes true;

for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	rsync -avz -e "ssh -oStrictHostKeyChecking=no" /etc/{passwd,shadow,group} root@$ip:/etc &
done
