#!/bin/bash

git pull

# install
. install.sh
sleep 5

echo "${_GREEN}UPDATE COMPLETE${_RESET}"
