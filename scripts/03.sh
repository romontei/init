#!/bin/bash

### Define error messages
#

E_ARG="Please strictly use one argument."
E_BOL="Your argument file does not exist."


### Execute script
#

## Check if there is only one argument
if [ $# = 1 ]; then

	## Get the command return
	RET=$(ls -lS $1 2>/dev/null)
	
	## Get the FD where the return came from
	ERR=$(echo $?)
	
	## Check if th FD is the error output
	if [ "$ERR" -eq "1" ]; then
		echo "$E_BOL"
	
	## Diplay the result
	else
		echo "$RET"
	fi

## There is too less/much argument
else 
	echo "$E_ARG"
fi
