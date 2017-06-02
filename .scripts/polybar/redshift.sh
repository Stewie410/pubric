#!/bin/bash
#
# Specifying the icon in the script
# Allows appearance to be changed conditionally
icon=""

pgrep -x redshift &> /dev/null
if [[ $? -eq 0 ]]; then
	temp=$(redshift -p 2>/dev/null | grep temp | cut -d' ' -f3)
	temp=${temp//K/}
fi

# Append ' ${temp}K' after $icon to display temperature
if [[ -z $temp ]]; then
	#echo "%{F#65737E}$icon"		# Grayed out (off)--Default
	echo "%{F#DFDFDF}$icon"			# Grayed out (off)
elif [[ $temp -ge 5000 ]]; then
	echo "%{F#65737E}$icon"			# Blue
elif [[ $temp -ge 4000 ]]; then
	echo "%{F#EBCB8B}$icon"			# Yellow
else
	echo "%{F#D08770}$icon"			# Orange
fi

# Click handler
if [[ ${BLOCK_BUTTON} -eq 1 ]]; then
	source /home/alex/.scripts/tools/redshift_start.sh restart
fi
