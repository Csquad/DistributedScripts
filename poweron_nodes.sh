#!/bin/bash

macs=("00:1B:24:1D:EF:DE 00:1B:24:1D:F2:06 00:16:36:E9:2B:48 00:16:36:E7:85:9D 00:1B:24:2D:BC:91 00:16:36:E9:2B:D4 00:1B:24:1D:EF:12 00:16:36:E9:2A:F4 00:1B:24:2D:E6:E9 00:1B:24:1D:EF:FE 00:1B:24:1D:F0:7E 00:1B:24:1D:F0:5E 00:09:3D:13:D8:DE 00:09:3D:13:DE:14 00:09:3D:13:D3:D3 00:09:3D:13:D8:B7 00:09:3D:13:F6:9A 00:09:3D:13:D8:24 00:09:3D:13:F6:3C 00:09:3D:13:D4:57 00:09:3D:13:D9:02 00:09:3D:13:D4:63 00:09:3D:13:D8:BA 00:09:3D:13:D8:ED 00:09:3D:13:DE:59 00:09:3D:13:D4:7B 00:09:3D:13:57:46 00:09:3D:13:DD:57 00:09:3D:13:D3:E2 00:09:3D:13:FC:16 00:09:3D:13:D2:8C 00:09:3D:13:D3:EB")

for mac in ${macs[*]}; do
	#For CentOS
	ether-wake $mac;

	#For Arch Linux
	#wol $mac;
done
