#!/bin/bash

# Define applications to be stopped
declare -a app=()

for i in "${app[@]}" 
do
	if pgrep -x $i > /dev/null;  then
		killall -q -I $i
		while pgrep -x $i > /dev/null; do
			sleep 1;
		done
	fi
done
