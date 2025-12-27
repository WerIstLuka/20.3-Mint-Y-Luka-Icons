#!/bin/bash
for dir in 16 16@2x 22 22@2x 24 24@2x 32 32@2x 48 48@2x 64 64@2x 96 96@2x 256 256@2x; do
	if [ -d $dir ]; then
		rm -rf $dir
	fi
done
