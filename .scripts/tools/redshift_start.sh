#!/bin/bash

conf="/home/alex/.config/redshift/redshift.conf"

# Define function to restart redshift
redo() {
	killall -q redshift
	while pgrep -x redshift > /dev/null; do sleep 1; done
	redshift -l geoclue2 &
}

# check for arguments
if [[ $1 == "restart" ]]; then
	redo
	exit 1;
elif [[ $1 == "stop" ]]; then
	killall -q redshift
	exit 1;
elif [[ $1 == "print" ]]; then
	redshift -p
	exit 1;
fi

# Running part of the script
# If redshift is running, get current temperature
pgrep -x redshift & > /dev/null
if [[ $? -eq 0 ]]; then
	temp=$(redshift -p 2 > /dev/null | grep temp | cut -d' ' -f3)
	temp=${temp//K/}
else
	redshift -l geoclue2 &
fi

# if temp >= 5000, restart redshift
if [[ $temp -ge 5000 ]]; then
	redo
fi
