#!/bin/bash

function prompt_confirm() {
  while true; do
    read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY
    case $REPLY in
      [yY]) echo ; return 0 ;;
      [nN]) echo ; return 1 ;;
      *) printf " \033[31m %s \n\033[0m" "invalid input [y/n]"
    esac 
  done  
}

function show_mysettings () {
	if [ -f $_WORK_DIR/$_MYSETTINGS_FILE ]; then
                . $_MYSETTINGS_FILE
                echo "${_GREEN}Settings from loaded from mysettings.sh.${_RESET}"
                echo "${_GREEN}Pool URL:${_RESET}: $_POOL_SERVER_URL"
                echo "${_GREEN}Pool Port:${_RESET}: $_POOL_SERVER_PORT"
                echo "${_GREEN}Recieve Wallet:${_RESET}: $_RECEIVE_WALLET"
                echo "${_GREEN}Email Address:${_RESET}: $_EMAIL"
                echo "${_GREEN}Worker Identity:${_RESET}: $_API_WORKER_ID"
        fi
}

function build_xmrig () {
        if [ -d $_XMRIG_BUILD_LOCATION ]; then
                # Remove existing build directory
                rm -rf $_XMRIG_BUILD_LOCATION

                # Make new build directory
                mkdir $_XMRIG_BUILD_LOCATION
        else
                # Make new build directory
                mkdir $_XMRIG_BUILD_LOCATION
        fi

        # Change to build directory
        cd $_XMRIG_BUILD_LOCATION

        # Configure cmake scafolding
        cmake .. -DCMAKE_C_COMPILER=gcc-7 -DCMAKE_CXX_COMPILER=g++-7

        # Compile the software
        make
}


function start_xmrig () {
        screen -dmS $_XMRIG_SCREEN xmrig --config=$_XMRIG_CONFIG_LOCATION
}


function stop_xmrig () {
        screen -S $_XMRIG_SCREEN -X kill
}

function check_cpu () {
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

	# Get CPU L3 cache value
	_ENV_CORE_L3=$(getconf LEVEL3_CACHE_SIZE)
}

function calc_threads () {
	# Each thread needs 2048 byte (2 Megabyte)
	# Calculate number of threads supported with L3 cache size

	_ENV_THREAD_QTY=$(( ($_ENV_CORE_L3/2048)/1000 ))

	# Affine number of threads for _CPU_CN
	_COUNTER="$(( $_ENV_THREAD_QTY-1 ))"

	_ENV_CPU_THREAD_AFFINITY="$(seq -s " " 0 $_COUNTER)"

}

function calc_hugepages () {
         # Setting according to cpu cores but xmrig will not use all
         # change to make value use _ENV_CORE_THREADS
         # Check that hugepages set in /etc/sysctl.conf
       
         _ENV_CHECK="nr_hugepages"
     
         if sudo grep -q $_ENV_CHECK /etc/sysctl.conf; then
                 sudo sysctl -p
         else    
                 # Set value in current env
                 sudo sysctl -w vm.nr_hugepages="$_ENV_THREAD_QTY"
                 # Add value to sysctl
                 sudo sysctl -p
         fi

}

echo -e "${_GREEN}FUNCTIONS LOADED${_RESET}"
