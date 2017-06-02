#!/bin/bash
pac=$(checkupdates | wc -l)
aur=$(cower -u | wc -l)
icon=""

check=$((pac + aur))

if [[ "$check" != 0 ]]; then
	echo "$pac %{F#dfdfdf}%{F-} $aur"
fi
