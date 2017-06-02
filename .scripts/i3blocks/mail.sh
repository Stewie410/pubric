#!/bin/bash

USER=rapaarfus139@gmail.com
PASS=Zf6CiUUq42S0MldbTxMU

COUNT='curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"'
COUNT='echo "$COUNT" | grep -oPml "(?<=<fullcount>) [^<]+" '
echo $COUNT
if [ "$COUNT" != "0" ]; then
	if [ "$COUNT" = "1" ]; then
		WORD="mail";
	else
		WORD="mails";
	fi
fi
