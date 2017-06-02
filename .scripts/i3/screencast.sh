#!/bin/bash
#
# Picks a name, then play-pause ffmpeg
#
# Written by: Luke Smith
dir="~/Videos/casts/raw/video"
if [[ -f $dir/cast.mkv ]]; then
	n=1
	while [[ -f $dir/cast_$n.mkv ]]; do
		n=$(qalc -t $n + 1)
	done
	filename="$dir/output_$n.mkv"
	echo $n
else
	filename="$dir/output.mkv"
fi

# FFMPEG
ffmpeq -y -f x11grab -s $(xdpyinfo | grep dimensions | awk '{print $2;}') -i :0.0 -f alsa -i default -c:v ffvhuff -r 30 -c:a flac $filename
