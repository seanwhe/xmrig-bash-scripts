#!/bin/bash

# Defines a user crontab with schedules as defined in settings.sh
# Used in conjunction with crontab-off.sh to toggle user crontab between states:
# on - start/stop xmrig at specified times
# off - do not start/stop xmrig

echo "####################################"
echo "#   ENABLING CRONTAB               #"
echo "####################################"

# Get settings
. settings.sh
. functions.sh
sleep 5

# Setup crontab for user
. crontab.sh
sleep 5

echo "####################################"
echo "#   CRONTAB ENABLED                #"
echo "####################################"

