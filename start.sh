#!/bin/bash

echo "${_GREEN}MINING STARTED${_RESET}"

# When this script is:
# * run by crontab, load the settings
# * run by install, do not load settings

# Reload settings and functions for when running standalone
. functions.sh
. settings.sh

if ! screen -list | grep -q "$_XMRIG_SCREEN"; then

        # Call functions
	show_settings
        start_xmrig

        # List screen
        screen -ls
else

	# List screen
	screen -ls

fi

echo "${_CYAN}MINING RUNNING${_RESET}"
echo "${_YELLOW}  The process is running in a screen session."
echo "${_YELLOW}  The screen session is named:${_RESET} $_XMRIG_SCREEN"
echo "${_YELLOW}  Command to view process:${_RESET} screen -r $_XMRIG_SCREEN"
echo "${_MAGENTA} ENJOY!!!${_RESET}"

