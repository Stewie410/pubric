#!/bin/bash

# Terminate already running instances of polybar
killall -q polybar 

# Wait until above has finished
while pgrep -x polybar >/dev/null;
do
	sleep 1;
done

# Launch Bar(s)
polybar tbar &
polybar bbar &
echo "Bars launched..."
