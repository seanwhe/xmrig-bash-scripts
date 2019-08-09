#!/bin/bash

# Removes a user crontab
# Used in conjunction with crontab-on.sh to toggle user crontab between states:
# on - start/stop xmrig at specified times
# off - do not start/stop xmrig

echo "#################################"
echo "#  DISABLING CRONTAB            #"
echo "#################################"


# Remove existing crontab
echo "Backup existing crontab"
crontab -l > crontab

echo "Removing exiting crontab"
crontab -r

echo "#################################"
echo "#  CRONTAB DISABLED             #"
echo "#################################"

