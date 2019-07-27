#!/bin/bash

echo "#################################"
echo " BUILD STARTING"
echo "#################################"

# Clone source
if [ -d "$_XMRIG_CLONE_LOCATION" ]; then
	echo "Clone already exists"
	
	# Change to clone directory
	cd $_XMRIG_CLONE

	# Pull changes from source
	git pull

	# Call function
        build_xmrig

else
	# Clone the source
	echo "Cloning source to $_WORK_DIR/$_XMRIG_CLONE"
	git clone $_XMRIG_REPO $_XMRIG_CLONE
	
	# Change to clone directory
	cd $_XMRIG_CLONE

	# Fetch list of branches in origin
	git branch -a

	# Checkout required branch
	git checkout $_XMRIG_BRANCH

	# Call function
	build_xmrig
fi

# Copy binary to directory in env path
sudo cp $_XMRIG_BUILD_LOCATION/xmrig $_XMRIG_TARGET_LOCATION

cd $_WORK_DIR

echo "#################################"
echo " BUILD COMPLETE"
echo "#################################"

