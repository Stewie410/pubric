#!/bin/bash

# Left-click to play/pause toggle
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
	playerctl next
# Right-click to go to the next song
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
	playerctl previous
fi

# Print song info
spotify-now -i "%artist - %title"

