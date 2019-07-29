#!/bin/bash
echo "#################################"
echo " INSTALLING DEPENDENCIES "
echo "#################################"

# Install the software requirements

if [ $_APT_DEPENDS = 1 ]; then
	
	sudo apt install -y cpuid jo screen software-properties-common git build-essential cmake libuv1-dev libssl-dev libmicrohttpd-dev gcc g++
	# Install xmrig depends
	sudo apt-get install git build-essential cmake libuv1-dev libmicrohttpd-dev libssl-dev libhwloc-dev
	# Install xmrig-bash-scripts depends
	sudo apt install jo cpuid
else
        echo "Depend install is set to NO ($_APT_DEPENDS) Skipping"
fi

echo "#################################"
echo " DEPENDENCIES INSTALLED  "
echo "#################################"
