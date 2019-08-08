#!/bin/bash

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

