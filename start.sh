#!/bin/bash

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

# Reload settings and functions for when running standalone
. settings.sh
. functions.sh

if ! screen -list | grep -q "$_XMRIG_SCREEN"; then
        
	# Call function
        start_xmrig

        # List screen
        screen -ls
else

	# List screen
	screen -ls

fi

echo "MINING STARTED"

