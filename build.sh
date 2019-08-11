#!/bin/bash

# Clone source
if [ -d "$_XMRIG_CLONE_LOCATION" ]; then
	
	# Change to clone directory
	cd $_XMRIG_CLONE

        if git branch | grep -q -m1 "* $_XMRIG_BRANCH"; then
                # Pull changes from source
                git pull

                # Call function
                build_xmrig

        else
                # Switch to required branch
                git checkout $_XMRIG_BRANCH

                # Pull changes from source
                git pull

                # Call function
                build_xmrig
        fi
else
	# Clone the source
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

echo "${_GREEN}BUILD COMPLETE${_RESET}"

