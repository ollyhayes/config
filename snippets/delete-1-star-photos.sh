#!/bin/bash

for file in $(find . -iname "*.jpg")
do
	echo "checking $file"
	if exiftool "$file" | grep -q "Rating *: 1"
	then
		echo "deleting $file"
		rm $file
	fi
done
