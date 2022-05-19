#! /bin/bash

CARD="/media/sdcard"
DEST="/media/sw-archive/work/photography/_inbox/_unsorted/"

logger "Beginning import for mounted SD card."

cp -a "$CARD"/DCIM/* "$DEST"
TX=$?

if [[ $TX -eq 0 ]]; then
	umount "$CARD"
	logger "Files from $CARD succesfully imported, card unmounted."
	echo "The card has been unmounted and is ready for reformatting." | mail -s "Files from $CARD succesfully imported." sam@swlkr.net || logger "mail failed to send."
else
	logger "Import of files from $CARD FAILED. Card has not been unmounted."
	echo "The drive has not been unmounted." | mail -s "Files from $CARD FAILED to import." sam@swlkr.net || logger "mail failed to send."
fi

