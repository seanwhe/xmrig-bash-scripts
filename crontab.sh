#!/bin/bash

# Set values in settings script

echo "#################################"
echo " UPDATING CRONTAB"
echo "#################################"


# Remove existing crontab
echo "Backup existing crontab"
crontab -l > crontab

echo "Removing exiting crontab"
crontab -r

# Setup users contab
echo "Creating new crontab"

crontab -l | { cat; echo "#Start at $_USER_TIMESTART on days $_USER_CRONDAYS
0 $_USER_CRONSTART * * $_USER_CRONDAYS screen -dmS $_XMRIG_SCREEN xmrig --config=$_XMRIG_CONFIG_LOCATION"; } | crontab -

crontab -l | { cat; echo "#Stop at $_USER_TIMESTOP on days $_USER_CRONDAYS
0 $_USER_CRONSTOP * * $_USER_CRONDAYS screen -S $_XMRIG_SCREEN -X kill"; } | crontab -


echo "#################################"
echo " CRONTAB UPDATED"
echo "#################################"

