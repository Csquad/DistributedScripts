#!/bin/bash

source ./get_nodes.sh
get_nodes true;

pass="ourdearcluster"

for ip in ${all[*]}; do
	case "${exception[@]}" in  *"$ip"*) continue ;; esac

	sshpass -p $pass ssh-copy-id -oStrictHostKeyChecking=no root@"$ip";
done

