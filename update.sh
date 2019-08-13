#!/bin/bash

echo "${_GREEN}UPDATE STARTED${_RESET}"

git pull

# install
. install.sh
sleep 5

echo "${_CYAN}UPDATE COMPLETE${_RESET}"
