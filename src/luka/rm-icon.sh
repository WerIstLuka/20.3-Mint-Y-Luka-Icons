#!/bin/bash

if [ "$1" == "" ]; then
	read -r -p "enter icon name: " IconName
else
	IconName=$1
fi

read -r -p "enter directory name: " DirName


for dir in 16 16@2x 22 22@2x 24 24@2x 32 32@2x 48 48@2x 64 64@2x 96 96@2x 256 256@2x; do
	rm ../../usr/share/icons/20.3-Mint-Y-Luka/$DirName/$dir/$IconName
	if [ $? -ne 0 ]; then
		echo "make sure to change the file extension"
		exit 1
	fi
done
