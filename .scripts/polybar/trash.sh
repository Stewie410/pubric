#!/bin/bash

# Set trash directory
TRASH_DIR="${BLOCK_INSTANCE}"

# If $TRASH_DIR == null, set to ~/.local/share/Trash/
if [[ "${TRASH_DIR}" = "" ]]; then
	TRASH_DIR="${XDG_DATA_HOME:-${HOME}/.local/share}/Trash"
fi

# If $TRASH_DIR/<files/info/expungded> == null, make
if [[ ! -d "${TRASH_DIR}/files" ]]; then
	sudo mkdir "${TRASH_DIR}/files"
elif [[ ! -d "${TRASH_DIR}/info" ]]; then
	sudo mkdir "${TRASH_DIR}/info"
elif [[ ! -d "${TRASH_DIR}/expunged" ]]; then
	sudo mkdir "${TRASH_DIR}/expunged"
fi

# Left-click to open $TRASH_DIR/files in file manager (pick one)
if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
	thunar "${TRASH_DIR}/files"				# Thunar
	#termite -e ranger "${TRASH_DIR}/files"			# Ranger
# Right-click to empty trash
elif [[ "${BLOCK_BUTTON}" -eq 3 ]]; then
	rm -f "${TRASH_DIR}/files/*"
	rm -f "${TRASH_DIR}/info/*"
	rm -f "$TRASH_DIR}/expunged/*"
fi

# Get number of files in trash
TRASH_COUNT=$(ls -U -1 "${TRASH_DIR}/files" | wc -l)
URGENT_VALUE=30

echo "${TRASH_COUNT}"
echo "${TRASH_COUNT}"
echo ""

if [[ "${TRASH_COUNT}" -ge "${URGENT_VALUE}" ]]; then
	exit 31
fi
