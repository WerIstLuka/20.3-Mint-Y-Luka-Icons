#!/bin/bash

if [ "$1" == "" ]; then
	echo "if its an application just do apps"
	read -r -p "enter target directory: " target
else
	target=$1
fi

for dir in 16 16@2x 22 22@2x 24 24@2x 32 32@2x 48 48@2x 64 64@2x 96 96@2x 256 256@2x; do
	if [ -d $dir ]; then true; else
		echo "missing directory " $dir
		exit 1
	fi
	cp $dir/* ../../usr/share/icons/20.3-Mint-Y-Luka/$target/$dir
done
