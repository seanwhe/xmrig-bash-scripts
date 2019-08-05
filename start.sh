#!/usr/bin/env bash

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

echo "####################################"
echo " STARTING "
echo "####################################"
. settings.sh
. functions.sh

if ! screen -list | grep -q "$_XMRIG_SCREEN"; then
        # Call function
	echo "No screen sessionfound. Starting new screen session."
        start_xmrig

        # List screen
        screen -ls
else
	# Call function
        echo "Found existing screen session. Leaving."

	# List screen
	screen -ls

fi

echo "####################################"
echo " STARTED - use screen -r to view "
echo "####################################"

