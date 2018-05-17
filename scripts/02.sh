#!/bin/bash

### Datas preparation
#

## Get date informations
DATE=$(date +"%m-%d-%y")
HOUR=$(date +"%r")

## Set a new line variable
RET="=============================="

## Concat date informations
TIME="$RET The $DATE at $HOUR $RET"

## Store the package list update command
UPDATE="apt-get update >> /var/log/update_script.log"

## Store the package update commandi - option y to overpass confirmation
UPGRADE="apt-get upgrade -y >> /var/log/update_script.log"


### Script execution
#

## Format the top of a new insert
sudo sh -c "echo $TIME >> /var/log/update_script.log"

## Execute the command
sudo sh -c "$UPDATE && $UPGRADE"


### Cron handling
#

## Open the crontab modification
# crontab -e

## Execute on every monday at 4am from scripts folder in $HOME
# 0 4 * * MON ~/scripts/02.sh

echo "DONE !"
