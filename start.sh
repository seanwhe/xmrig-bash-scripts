#!/bin/bash

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

# Reload settings and functions for when running standalone
. functions.sh
. settings.sh

if ! screen -list | grep -q "$_XMRIG_SCREEN"; then

        # Call functions
	show_mysettings
        start_xmrig

        # List screen
        screen -ls
else

	# List screen
	screen -ls

fi

echo "${_GREEN}MINING STARTED${_RESET}"

