#!/bin/bash

echo "${_GREEN}CONFIG STARTED${_RESET}"

echo "$_CONFIG_JSON" | tee config.json

echo "${_CYAN}CONFIG STOPPED${_RESET}"

