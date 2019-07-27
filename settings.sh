#!/bin/bash

echo "#################################"
echo " LOADING SETTINGS "
echo "#################################"

# Set working directory
_WORK_DIR="$(pwd)"
cd $_WORK_DIR
echo -e "Working directory: $_WORK_DIR\n"

# Set repository from which to get the source
_XMRIG_REPO="https://github.com/xmrig/xmrig.git"
echo -e "Git source repo: $_XMRIG_REPO\n"

# Set name of folder to create when cloning from REPO
_XMRIG_CLONE="xmrig-cpu"
echo -e "Source folder name: $_XMRIG_CLONE\n"

# Set clone directory path
_XMRIG_CLONE_LOCATION="$_WORK_DIR/$_XMRIG_CLONE"
echo -e "Source folder location: $_XMRIG_CLONE_LOCATION\n"

# Set branch from which to build
_XMRIG_BRANCH="beta"
echo -e "Build branch: $_XMRIG_BRANCH\n"

# Set build directory
_XMRIG_BUILD="build"
echo -e "Build directory: $_XMRIG_BUILD\n"

# Set build directory location
_XMRIG_BUILD_LOCATION="$_XMRIG_CLONE_LOCATION/$_XMRIG_BUILD"
echo -e "Build directory location: $_XMRIG_BUILD_LOCATION\n"

# Set where to install binary
_XMRIG_TARGET_LOCATION="/usr/bin/"
echo -e "Install path: $_XMRIG_TARGET_LOCATION\n"

# Set the config file name
_XMRIG_CONFIG="config.json"
echo -e "Config file: $_XMRIG_CONFIG\n"

# Set config location
_XMRIG_CONFIG_LOCATION="$_WORK_DIR/$_XMRIG_CONFIG"
echo -e "Config file location: $_XMRIG_CONFIG_LOCATION\n"

# Set values for crontab
_USER_CRONSTART="18"
_USER_CRONSTOP="6"
_USER_CRONDAYS="1-5"
echo -e "Cron job start: $_USER_CRONSTART\n"
echo -e "Cron job stop: $_USER_CRONSTOP\n"
echo -e "Cron on days: $_USER_CRONDAYS\n"

# Set the name of the screen created by start script
_XMRIG_SCREEN="xmrig-cpu"
echo -e "Screen session name: $_XMRIG_SCREEN\n"

# Get number of available CPU Cores
_ENV_CORE=$(nproc --all)
echo -e "CPU Cores: $_ENV_CORE\n"

# Set that user passwdless sudo 
#sudo grep $USER /etc/sudoers.d/README

if sudo grep -q $USER /etc/sudoers.d/README; then
	echo -e "User $USER found in /etc/sudoers.d/README. All good!!\n"
else
	echo -e "$USER does not have passwdles sudo. Fixing that!!\n"
        echo "$USER     ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers.d/README
fi

# Check that hugepages set in /etc/sysctl.conf
_ENV_CHECK="nr_hugepages"

if sudo grep -q $_ENV_CHECK /etc/sysctl.conf; then
	echo "Found nr_hugepages in /etc/sysctl.conf. All good!!"
        echo -e "Refreshing sysctl configuration just to be sure.\n"
        sudo sysctl -p
else
	# Set value in current env
        echo -e "Did not find nr_hugepages in /etc/sysctl.conf. Fixing that!!\n"
        sudo sysctl -w vm.nr_hugepages="$_ENV_CORE"

        # Add value to sysctl
        echo "vm.nr_hugepages=$_ENV_CORE" | sudo tee -a /etc/sysctl.conf
fi

# Run apt maintenance
_APT_MAINETANCE="0"

# Run install of depends
_APT_DEPENDS="0"

echo "#################################"
echo " SETTINGS LOADED"
echo "#################################"

