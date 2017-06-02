#!/bin/bash

# Scrot automation for file name
dir="/home/alex/Pictures/Screenshots/Scrot"
if [[ -f $dir/screenshot.png ]]; then
	n=1
	while [[ -f $dir/screenshot_$n.png ]]; do
		n=$(qalc -t $n + 1)
	done
	filename="$dir/screenshot_$n.png"
	echo $n
else
	filename="$dir/screenshot.png"
fi

# Scrot 
scrot $filename
