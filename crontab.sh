#!/bin/bash


echo "${_GREEN}CRONTAB STARTED${_RESET}"

# Set values in settings script

# Remove existing crontab
crontab -l > crontab

crontab -r

# Setup users contab

crontab -l | { cat; echo "#Start at $_USER_TIMESTART on days $_USER_CRONDAYS
0 $_USER_CRONSTART * * $_USER_CRONDAYS screen -dmS $_XMRIG_SCREEN xmrig --config=$_XMRIG_CONFIG_LOCATION"; } | crontab -

crontab -l | { cat; echo "#Stop at $_USER_TIMESTOP on days $_USER_CRONDAYS
0 $_USER_CRONSTOP * * $_USER_CRONDAYS screen -S $_XMRIG_SCREEN -X kill"; } | crontab -

echo "${_CYAN}CRONTAB STOPPED${_RESET}"

