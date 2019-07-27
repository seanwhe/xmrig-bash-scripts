#!/bin/bash

echo "####################################"
echo "#    STARTING SYSTEM MAINTENANCE   #"
echo "####################################"

if [ $_APT_MAINETANCE = 1 ]; then

	sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean

else
	echo "Apt maintenance is set to NO ($_APT_MAINETANCE) Skipping"
fi

echo "####################################"
echo "#    SYSTEM MAINTENANCE COMPLETE   #"
echo "####################################"

