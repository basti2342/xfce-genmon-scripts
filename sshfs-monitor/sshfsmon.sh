#!/bin/bash

# user who owns the chroot
chrootSshUser="chrootuser"
# max outgoing speed
maxUp=1150

while [ true ]; do
	iotop=$(/usr/sbin/iotop -u $chrootSshUser -bktoqqq --iter=2 | tail -n1)
	speed=$(echo "$iotop" | awk '{print $5}')
	if [[ "$speed" == "" ]]; then
		speed="0"
	else
		speed=$(bc <<< "scale = 0; $speed*100/$maxUp")
	fi

	# if you wish, you could get the filename using the PID and lsof -p
	echo "<tool>chroot speed used by $chrootSshUser</tool><bar>$speed</bar>" > /home/$chrootSshUser/.sshchrootspeed
	sleep 5
done
