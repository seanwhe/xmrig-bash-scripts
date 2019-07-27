#!/bin/bash
echo "#################################"
echo " INSTALLING DEPENDENCIES "
echo "#################################"

# Install the software requirements

if [ $_APT_DEPENDS = 1 ]; then
	
	sudo apt install -y screen software-properties-common git jq build-essential cmake libuv1-dev libssl-dev libmicrohttpd-dev gcc g++

else
        echo "Depend install is set to NO ($_APT_DEPENDS) Skipping"
fi

echo "#################################"
echo " DEPENDENCIES INSTALLED  "
echo "#################################"
