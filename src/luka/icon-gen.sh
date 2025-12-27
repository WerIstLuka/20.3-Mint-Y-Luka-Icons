#!/bin/bash

if [ "$1" == "" ]; then
	read -r -p "enter icon name: " IconName
else
	IconName=$1
fi


if [[ "$IconName"  == *.svg ]]; then
	echo "using inkscape to render"
else
	echo "using ffmpeg to render"
fi

test -f "$IconName" || ( echo "file $IconName doesnt exist" && exit )

Output=$(echo "$IconName" | cut -f1 -d'.')

for Size in 16 22 24 32 44 48 64 96 128 192 256 512; do
	if [ -d $Size ]; then true; else
		mkdir $Size
	fi
	if [[ "$IconName"  == *.svg ]]; then
		inkscape "$IconName" --export-width="$Size" --export-filename="$Size/$Output.png" &> /dev/null
	else
		ffmpeg -hide_banner -loglevel error -i "$IconName" -vf scale="$Size:-1" "$Size/$Output.png"
	fi
done

for dir in 16@2x 22@2x 24@2x 32@2x 48@2x 64@2x 96@2x 256@2x; do
	if [ -d $dir ]; then true; else
		mkdir $dir
	fi
done

cp 32/*  16@2x
cp 44/*  22@2x;  rm -rf 44
cp 48/*  24@2x
cp 64/*  32@2x
cp 96/*  48@2x
cp 128/* 64@2x;  rm -rf 128
cp 192/* 96@2x;  rm -rf 192
cp 512/* 256@2x; rm -rf 512
