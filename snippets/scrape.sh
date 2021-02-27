#!/bin/bash


for number in {21..65}
do
	wget "example?page=$number"
done