#!/bin/bash

dir=./usr/share/icons/20.3-Mint-Y-Luka

help(){
	echo remove an icon from a specified category in ./usr
	echo
	echo usage:
	echo "  "./remove-icons.sh apps clockenstein-calendar.png
	echo "  "removes all clockenstein-calendar.png in the apps category
	echo
	echo valid categories are:
	echo "  "actions animations apps categories devices emblems index.theme legacy mimetypes places status ui
}

if (( "${#@}" == 0 )); then
	help
	exit 1
fi

if (( "${#@}" > 2 )); then
	echo too many arguments
	exit 1
fi

if [ "$1" == "" ]; then
	echo no category given
	exit 1
fi

if [ "$2" == "" ]; then
	echo no icon given
	exit 1
fi


find "$dir"/"$1" -name "$2" -type f,l -exec rm {} \;
