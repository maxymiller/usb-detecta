#!/bin/bash
usbdetecta=0
devsd="sd$1"
dev="/dev/$devsd"
devpart="$2"
echo -e "[\e[32mINFO\e[0m] $0: start" 1>&2
echo -e "[\e[32mINFO\e[0m] perando por \"$dev\"..." 1>&2
while true
do
	if ls /dev | grep -q "$devsd"
	then
		if [ "$usbdetecta" == "0" ]
		then
			echo -e "[\e[32mINFO\e[0m] pera 10s..." 1>&2
			sleep 10
			if ./mountusb.sh "${dev}${devpart}" 1>&2
			then
				mounusb=$(./mountusb.sh "${dev}${devpart}")
				echo -e "[\e[32mINFO\e[0m] mount: \"${mounusb}\"" 1>&2
			else
				if ./mount.sh "1" "${dev}" "${devpart}"
				then
					mounusb=$(./mountusb.sh "${dev}${devpart}")
				else
					#sudo mkdir -p "/mnt/media/${devsd}/${devpart}"
					#sudo mount "${dev}${devpart}" "/mnt/media/${devsd}/${devpart}"
					./mount.sh "1" "${dev}" "${devpart}" "${devsd}"
					mounusb=$(./mountusb.sh "${dev}${devpart}")
				fi
			fi
			gnome-terminal -- bash -c "./list.sh \"$mounusb\" \"$devsd\""
			usbdetecta=1
		fi
	else
		if [ "$usbdetecta" == "1" ]
		then
			echo -e "[\e[32mINFO\e[0m] usb desconectado" 1>&2
			usbdetecta=0
		fi
		#echo -e "[\e[31mERROR\e[0m] 3s" 1>&2
		sleep 3
	fi
done
