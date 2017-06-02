#!/bin/bash
# Enable tap to click and libinput-gestures

# Check to see if libinput-gestures is running (and stop it)
if libinput-gestures-setup status | grep -q "is running"; then
	libinput-gestures-setup stop
fi
libinput-gestures-setup start

# If tap-to-click == 0, enable
tap=$(xinput list-props 11 | grep 276 | tail -c 2)
if [[ ${tap} -eq 0 ]]; then
	xinput set-prop 11 276 1
fi
