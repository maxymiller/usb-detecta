#!/bin/bash

echo -e "[\e[32mINFO\e[0m] $0: start" 1>&2
echo "0" > ./valor/in
out=0
while true
do
	sleep 1
	in="$(cat ./valor/in)"
	if [ "$in" != "0" ]
	then
		devsd="$(cat ./valor/devsd)"
		dev="$(cat ./valor/dev)"
		devpart="$(cat ./valor/devpart)"
		maxypasta="$(cat ./valor/maxypasta)"
		case "$in" in
			1) mount "${dev}${devpart}" && out=1;;
			2) mkdir -p "/mnt/media/${devsd}/${devpart}"
			#mount "${dev}${devpart}" "/mnt/media/${devsd}/${devpart}" && out=1;;
			#todo mundo poder
			mount "${dev}${devpart}" "/mnt/media/${devsd}/${devpart}" -o rw,umask=000 && out=1;;
			3) umount "$maxypasta"; udisksctl power-off -b "/dev/$devsd" && out=1;;
		esac
		echo > ./valor/devsd
		echo > ./valor/dev
		echo > ./valor/devpart
		echo > ./valor/in
		echo > ./valor/maxypasta
		echo "$out" > ./valor/out
		echo "0" > ./valor/in
		
		echo -e "[\e[32mINFO\e[0m] devsd: $devsd"
		echo -e "[\e[32mINFO\e[0m] dev: $dev"
		echo -e "[\e[32mINFO\e[0m] devpart: $devpart"
		echo -e "[\e[32mINFO\e[0m] maxypasta: $maxypasta"
	fi
done
