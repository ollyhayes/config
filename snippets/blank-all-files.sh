#!/bin/bash

for file in $(find . -iname "*.jpg")
do
	echo "blanking $file"
	echo "" > $file
done
