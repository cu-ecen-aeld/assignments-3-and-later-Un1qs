#!/bin/sh

FILES_DIR="$1"
WRITE_STR="$2"

if [ $# -lt 2 ]; then
	echo "Error: Two arguments required"
	exit 1
fi

if touch "$FILES_DIR" ; then
	echo "$WRITE_STR" >> "$FILES_DIR"
	echo "Success: Write to $FILES_DIR"
else
	if mkdir -p "$(dirname "$FILES_DIR")" ; then
		touch "$FILES_DIR"
		echo "$WRITE_STR" >> "$FILES_DIR"
		echo "Success: Write to $FILES_DIR"
	else
		echo "Error: Cannot create file $FILES_DIR"
		exit 1
	fi
fi

