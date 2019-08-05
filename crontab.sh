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

# Define env path
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/games:/snap/bin:/bin/:$_WORK_DIR

# Setup users contab
crontab -l | { cat; echo "#Start at $_USER_TIMESTART on days $_USER_CRONDAYS
0 $_USER_CRONSTART * * $_USER_CRONDAYS bash start.sh"; } | crontab -

crontab -l | { cat; echo "#Stop at $_USER_TIMESTOP on days $_USER_CRONDAYS
0 $_USER_CRONSTOP * * $_USER_CRONDAYS bash stop.sh"; } | crontab -


crontab -l

echo "#################################"
echo " CRONTAB UPDATED"
echo "#################################"

