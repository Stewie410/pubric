#!/bin/bash
#
# Picks a filename, records ffmpeg
dir="~/Videos/casts/raw/audio"
if [[ -f $dir/output.flac ]]; then
	n=1
	while [[ -f $dir/output_$n.flac ]]; do
		n=$(qalc -t $n + 1)
	done
	filename="$dir/output_$n.flac"
	echo $n
else
	filename="$dir/output.flac"
fi

# ffmpeg command
ffmpeg -f alsa -i default -c:a flac $filename
