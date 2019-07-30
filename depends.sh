#!/bin/bash
echo "#################################"
echo " INSTALLING DEPENDENCIES "
echo "#################################"

# Install the software requirements

if [ $_APT_DEPENDS = 1 ]; then

        # Install xmrig depends	
	sudo apt install -y software-properties-common git build-essential cmake libuv1-dev libssl-dev libmicrohttpd-dev libhwloc-dev gcc g++

	# Install xmrig-bash-scripts depends
	sudo apt install -y jo cpuid screen
else

        echo "Depend install is set to NO ($_APT_DEPENDS) Skipping"

fi

echo "#################################"
echo " DEPENDENCIES INSTALLED  "
echo "#################################"
