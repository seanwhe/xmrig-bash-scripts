#!/bin/bash

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

echo "####################################"
echo " STARTING "
echo "####################################"

if [ -z "$_XMRIG_SCREEN" ]; then
	# Load settings when run by crontab
	# Also ensures vm.nr_hugepages is set
        . settings.sh

	# Check another instance is not already running
	if ! screen -list | grep -q "$_XMRIG_SCREEN"; then
		# Call function
		start_xmrig
	fi
else
	# Call function
        start_xmrig

	# Unset _XMRIG_SCREEN variable. 
	# The start script will have to load settings on next start
	$_XMRIG_SCREEN=""
fi

# List screen
screen -ls

echo "####################################"
echo " STARTED - use screen -r to view "
echo "####################################"

