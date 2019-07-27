#!/bin/bash

# Get settings 
. settings.sh
sleep 5

# Stop running instance
. stop.sh

# Get source and build by sourcing our build file
. build.sh
sleep 5

# Setup crontab for user
. crontab.sh
sleep 5

# Unset REPO variable so start script will execute program 
SCREEN=""

# Start mining
. start.sh


echo "####################################"
echo "# ALL DONE - INSTALLATION COMPLETE #"
echo "####################################"
