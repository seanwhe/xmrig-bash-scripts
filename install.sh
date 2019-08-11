#!/bin/bash


# Colors
_CYAN=`tput setaf 1`
_GREEN=`tput setaf 2`
_YELLOW=`tput setaf 3`
_BLUE=`tput setaf 4`
_MAGENTA=`tput setaf 5`
_CYAN=`tput setaf 6`
_RESET=`tput sgr0`

echo "${_GREEN}INSTALLATION STARTED${_RESET}"

_DEBUG=$1

if $_DEBUG; then
	set +x
else
	set -x
fi

# Set that user passwdless sudo
if sudo grep -q $USER /etc/sudoers.d/README; then
        echo -e "User $USER found in /etc/sudoers.d/README. All good!!\n"
else
        echo -e "$USER does not have passwdles sudo. Fixing that!!\n"
        echo "$USER     ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/README
fi

# Load functions
. functions.sh
sleep 5

# Get settings 
. settings.sh
sleep 5

# User input
. input.sh
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


echo -e "${_CYAN}INSTALLATION STOPPED${_RESET}"
