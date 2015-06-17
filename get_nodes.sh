#!/bin/bash

#Check which servers is up and populate the arrays x2200, v20z and all
#For verbose mode run:
#get_nodes true

get_nodes() {
	ip neigh flush all;
	for (( i=1; i<=255; i++ ))
	do
		ping -c 1 192.168.1."$i" > /dev/null 2>&1 &
	done

	sleep 1; #waiting for the ping returns

	x2200=(`arp -n | egrep '00:1b:24|00:16:36' | egrep -o '192\.168\.1\.[0-9]*'`)
	v20z=(`arp -n | egrep '00:09:3d' | egrep -o '192\.168\.1\.[0-9]*' | egrep -v '192.168.1.1$'`)
	all=(${x2200[*]} ${v20z[*]})

	if [ $# -eq 1 ] && [ "$1" = true ]; then
		echo "X2200 running: "${#x2200[*]};
		echo "v20z running: "${#v20z[*]};

		echo "total running: "${#all[*]};
	fi
}
