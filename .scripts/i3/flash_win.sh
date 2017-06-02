#!/bin/bash
#
# Flashes the active window
#
# Requires transset-df & a composite manager, such as compton or xcompmgr

function flash() {
	transset-df -a -m 0
	sleep 0.1
	transset-df -a -x 1
	sleep 0.1
}

flash
flash
