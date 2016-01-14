#!/bin/bash

pass="INFO4035"

users=(ejb1864 exb0364 eac6996 etd1570 eae6198 eek5559 esk2603 ell2136 eml5534 efl3697 esl8420 elm3799 epm9135 ewo2600 eyo3005 ejr7249);

for user in ${users[*]}; do
	ret=false
	getent passwd $user >/dev/null 2>&1 && ret=true

	if $ret; then
		echo "User "$user" exist."
	else
		echo "Creating user "$user"."
		useradd -m "$user"
		echo -e $pass"\n"$pass | (passwd --stdin "$user")
		echo "export LD_LIBRARY_PATH=\"/usr/lib64/openmpi/lib:\"$LD_LIBRARY_PATH" >> /home/"$user"/.bashrc
		echo "export PATH=$PATH:\"/usr/lib64/openmpi/bin/\"" >> /home/"$user"/.bashrc
		su -m "$user" -c "mkdir /home/$user/.ssh/; ssh-keygen -t rsa -N \"\" -f /home/$user/.ssh/id_rsa;"
		cat /home/"$user"/.ssh/id_rsa.pub >> /home/"$user"/.ssh/authorized_keys
		chown "$user":"$user" /home/"$user"/.ssh/authorized_keys
	fi
done
