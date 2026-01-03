#!/bin/bash
dev="$1"

case "$2" in
	uuid ) findmnt -n -o UUID "$dev";;
	label ) findmnt -n -o LABEL "$dev";;
	*) findmnt -n -o TARGET "$dev";;
esac
