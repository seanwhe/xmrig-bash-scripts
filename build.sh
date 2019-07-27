#!/bin/bash

build_xmrig () {
        if [ -d $_XMRIG_BUILD_LOCATION ]; then
                # Remove existing build directory
                echo "Found old build directory. Removing"
                rm -rf $_XMRIG_BUILD_LOCATION

		# Make new build directory
                echo "Creating a build directory"
                mkdir $_XMRIG_BUILD_LOCATION
        else
                # Make new build directory
                echo "Creating a build directory"
                mkdir $_XMRIG_BUILD_LOCATION
        fi

        # Change to build directory
        echo "Changing to build directory"
        cd $_XMRIG_BUILD_LOCATION 

        # Configure cmake scafolding
        echo "Configuring cmake scafolding"
        cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

        # Compile the software
        echo "Starting build"
        make
}

echo "#################################"
echo " BUILD STARTING"
echo "#################################"

# Update system
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean

# Install the software requirements
sudo apt install -y screen software-properties-common git build-essential cmake libuv1-dev libssl-dev libmicrohttpd-dev gcc g++

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

