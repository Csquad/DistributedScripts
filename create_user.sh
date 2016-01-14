#Example array
#users=(eih1515 eyd2562 eyo3005 ekd4042 ejb1347);

users=(ecp8266);
for user in ${users[*]}; do
	echo "Creating user "$user".";
	useradd -m "$user"
	echo -e "cluster\ncluster" | (passwd --stdin "$user")
	echo "export LD_LIBRARY_PATH=\"/usr/lib64/openmpi/lib:\"$LD_LIBRARY_PATH" >> /home/"$user"/.bashrc
	echo "export PATH=$PATH:\"/usr/lib64/openmpi/bin/\"" >> /home/"$user"/.bashrc
	su -m "$user" -c "mkdir /home/$user/.ssh/; ssh-keygen -t rsa -N \"\" -f /home/$user/.ssh/id_rsa;"
	cat /home/"$user"/.ssh/id_rsa.pub >> /home/"$user"/.ssh/authorized_keys
	chown "$user":"$user" /home/"$user"/.ssh/authorized_keys
done
