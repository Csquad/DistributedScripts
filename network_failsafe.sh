#!/bin/bash

if ! ip addr | grep '192.168' > /dev/null 2>&1; then
	interfaces=(`ip link | egrep -o ': enp.*:' | tr -d ' ' | tr -d ':'`)
	for int in ${interfaces[*]}; do
		ip link set "$int" down;
		ip link set "$int" up;
	done

	dhclient -r;
fi

