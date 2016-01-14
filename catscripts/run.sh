
#!/bin/bash

#This script is designed to run multiple commands on all the nodes
#Target servers can be changed by using ${x2200[*]} or ${v20z[*]} arrays in place of ${all[*]}

cd /home/ecp8266/DBN/cluster/;
source ./get_nodes.sh
get_nodes true;

./create_hostfile.sh > tmp.host

ip=(`cat tmp.host | cut -d' ' -f1`);
nproc=(`cat tmp.host | cut -d' ' -f2`);
tab=();

for (( i=0; i<${#ip[*]}; ++i )); do
	for (( j=0; j<${nproc[$i]}; ++j )); do
		tab+="${ip[$i]} ";
	done
done

tab=($tab);
rm -rf tmp.host;

cd /home/ecp8266/DBN/;
#cp MakeGenetiqueForAll Makefile;
#make;

count=0;
for (( i=10; i<=25; ++i )); do
	for j in steghide freqsteg hide4pgp mixte; do

		ip=${tab[$count]};

		cmd="
		cd /home/ecp8266/DBN/;

		LD_LIBRARY_PATH=/home/ecp8266/MATLAB/MATLAB_Production_Server/R2015a/bin/glnxa64/:/home/ecp8266/MATLAB/MATLAB_Production_Server/R2015a/sys/os/glnxa64/:\$LD_LIBRARY_PATH;
		export LD_LIBRARY_PATH;

		./GenetiqueForAll $i $j
		"

		echo $ip" "$i" "$j;
		#ssh -oStrictHostKeyChecking=no ecp8266@$ip "$cmd" &

		count=$(($count+1));

		if [ $count -gt ${#tab[*]} ]; then
			break 2;
		fi

		#TESTING
		#break 2;

	done
done    
