#!/bin/bash

in="$1"
dev="$2"
devpart="$3"
devsd="$4"
maxypasta="$5"

out=""
echo > ./valor/out

echo "$dev" > ./valor/dev
echo "$devpart" > ./valor/devpart
echo "$devsd" > ./valor/devsd
echo "$maxypasta" > ./valor/maxypasta

echo "$in" > ./valor/in

while [ "$out" == "" ]
do
	out="$(cat ./valor/out)"
done

out="$(cat ./valor/out)"
[ "$out" == "1" ] && echo > /dev/null
