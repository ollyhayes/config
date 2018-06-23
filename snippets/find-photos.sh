#!/bin/bash



for file in $(find . -iname "*.jpg")
do
	echo "checking $file"
	if exiftool "$file" | grep "Rating *: 5"
	then
		echo "copying $file"
		cp "$file" $1
	fi
done
