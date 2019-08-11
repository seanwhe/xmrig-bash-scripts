#!/bin/bash

echo "${_GREEN}MAINTENANCE STARTED${_RESET}"

if [ $_APT_MAINETANCE = 1 ]; then

	sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean

fi

echo "${_CYAN}MAINTENANCE STOPPED${_RESET}"

