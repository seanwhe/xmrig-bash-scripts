#!/bin/bash

# Set that user passwdless sudo

if sudo grep -q $USER /etc/sudoers.d/README; then
        echo -e "User $USER found in /etc/sudoers.d/README. All good!!\n"
else
        echo -e "$USER does not have passwdles sudo. Fixing that!!\n"
        echo "$USER     ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/README
fi

# Get settings 
. settings.sh
. functions.sh
sleep 5

# Stop running instance
. stop.sh

# Update system
. maintenance.sh
sleep 5

# Install dependencies
. depends.sh
sleep 5

# Get source and build by sourcing our build file
. build.sh
sleep 5

# Create a config.json
. config.sh
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
