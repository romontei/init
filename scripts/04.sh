#!/bin/bash

### Define scripts variables
#

TMP=~/crontabTmp
REF=~/crontabRef

shasum /etc/crontab > $TMP

### Define mail content
#

BODY="Hi root, the crontab has been modified. Please verify the action origin."
SUBJECT="WARNING ! Crontab modification."

### Execute script
#

## Check if a crontab reference already exist
if [ -f $REF ]; then

	## Check if the current reference is different
	if [ "$(diff $TMP $REF)" != "" ]; then

		## Send a notification mail to user root
		echo "$BODY" | mail -s "$SUBJECT" root
	fi
fi

## Clean the tmp and assign it to ref
mv $TMP $REF

### Cron handling
#

## Open the crontab modification
# crontab -e

## Execute on every day at midnight from scripts folder in $HOME
# 0 0 * * * ~/scripts/04.sh
