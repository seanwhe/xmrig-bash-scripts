#!/bin/bash

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

if [ -z "$_XMRIG_SCREEN" ]; then
	# Load settings when run by crontab
	. settings.sh
	. functions.sh

	# Call function
	stop_xmrig
else
	# Call function
        stop_xmrig
fi

echo "${_GREEN}MINING STOPPED${_RESET}"

