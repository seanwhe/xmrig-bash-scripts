#!/bin/bash

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

stop_xmrig () {
	screen -S $_XMRIG_SCREEN -X kill
}

echo "#################################"
echo " KILLING SCREEN"
echo "#################################"

if [ -z "$_XMRIG_SCREEN" ]; then
	# Load settings when run by crontab
	echo "Loading settings"
	. settings.sh

	# Call function
	stop_xmrig
else
	# Call function
        stop_xmrig
fi

# Check results
echo "Screen listing"
screen -ls

echo "#################################"
echo " SCREEN KILLED"
echo "#################################"
