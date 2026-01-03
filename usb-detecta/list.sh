#!/bin/bash
maxypasta="$1"
maxydevsd="$2"
maxytitle="$(cat $maxypasta/title.yml)"
maxymenu="$(cat $maxypasta/menu.yml)"
maxylist="$(cat $maxypasta/list.yml)"
maxyerr=0

whiptail --title "usb" --msgbox "usb detecta" 10 40 1>&2
while [ "$maxyerr" == "0" ]
do
	if in=$(whiptail --title "$maxytitle" --menu "$maxymenu" 20 70 10 0 "Desconectado usb" $maxylist 3>&1 1>&2 2>&3)
	then
		if [ "$in" != "0" ]
		then
			bash -c "$maxypasta/start.sh $in $maxypasta $maxydevsd"
		else
			#sudo umount "$maxypasta"
			#sudo udisksctl power-off -b "/dev/$maxydevsd"
			./mount.sh 3 "" "" "$maxydevsd" "$maxypasta"
			maxyerr=1
		fi
	else
		#desconectado usb
		#./mount.sh 3 "" "" "$maxydevsd" "$maxypasta"
		maxyerr=1
	fi
done
