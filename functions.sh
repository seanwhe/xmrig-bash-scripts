#!/usr/bin/env bash

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


start_xmrig () {
        screen -dmS $_XMRIG_SCREEN xmrig --config=$_XMRIG_CONFIG_LOCATION
}


stop_xmrig () {
        screen -S $_XMRIG_SCREEN -X kill
}

check_cpu () {
	# Check if CPU supports AES-NI
	cpuid | grep -i aes > hw-aes.txt
	if grep -q true "hw-aes.txt"; then
        	_AES_NI=true
	else
        	_AES_NI=false
	fi
	rm hw-aes.txt

	# Get number of available CPU Cores
	_ENV_CORE=$(nproc --all)
	echo -e "CPU Cores: $_ENV_CORE\n"

	# Get CPU L3 cache value
	_ENV_CORE_L3=$(getconf LEVEL3_CACHE_SIZE)
	echo -e "L3 Cache in byte: $_ENV_CORE_L3\n"
}

calc_threads () {

	# Affine number of threads for _CPU_CN
	_COUNTER="$(($_ENV_CORE_THREADS - 1))"
	_ENV_CPU_THREADS=()

	for i in `seq 0 $_COUNTER`; do
        	_ENV_CPU_THREADS+=("$i")
	done

	echo "Thread CPU Affinity: ${_ENV_CPU_THREADS[@]}"
	_ENV_CPU_THREAD_AFFINITY="${_ENV_CPU_THREADS[@]}"

	# Setting according to cpu cores but xmrig will not use all
	# change to make value use _ENV_CORE_THREADS
	# Check that hugepages set in /etc/sysctl.conf
	_ENV_CHECK="nr_hugepages"

	if sudo grep -q $_ENV_CHECK /etc/sysctl.conf; then
        	echo "Found nr_hugepages in /etc/sysctl.conf. All good!!"
	        echo -e "Refreshing sysctl configuration just to be sure.\n"
        	sudo sysctl -p
	else
        	# Set value in current env
	        echo -e "Did not find nr_hugepages in /etc/sysctl.conf. Fixing that!!\n"
        	sudo sysctl -w vm.nr_hugepages="$_ENV_CORE"
	        sudo sysctl -p

        	# Add value to sysctl
	        echo "vm.nr_hugepages=$_ENV_CORE" | sudo tee -a /etc/sysctl.conf
	fi

}

