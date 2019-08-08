#!/bin/bash

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

