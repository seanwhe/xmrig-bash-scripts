#!/bin/bash

_EMAIL="miners@prepaidmeters.com"

_RECEIVE_WALLET="854sqm2Cm4TB2XgPHWqSPSbnFAe3SMzdEDzZHpukQ8NHBPFropbnkFmEKiZPgwjMFC9PTjaFscR2UU6ZwFCqJzGMUiZVbTM"

_POOL_SERVER_URL="192.168.4.5"
_POOL_SERVER_PORT="3333"

#######################################################################
#  DO NOT CHANGE AFTER THIS POINT UNLESS YOU KNOW WHAT YOU ARE DOING  #
#######################################################################

_API_ID="null"
_API_WORKER_ID="$HOSTNAME"

_AUTOSAVE="true"

_BACKGROUND="false"

_COLORS="true"

# call check_cpu
check_cpu

# call calc_threads
calc_threads

_CPU_ENABLED="true"
_CPU_HUGE_PAGES="true"
_CPU_HW_AES="$_AES_NI"
_CPU_PRIORITY="null"
_CPU_ASM="true"
_CPU_CN="$_ENV_CPU_THREAD_AFFINITY"

_CPU_CN_0="false"
_CPU_CN_LITE_0="false"

_DONATE_LEVEL="5"

_DONATE_OVER_PROXY="1"

_HTTP_ENABLED="true"
_HTTP_HOST=$(hostname --all-ip-addresses | awk '{print $1}')
_HTTP_PORT="8080"
_HTTP_ACCESS_TOKEN="null"
_HTTP_RESTRICTED="false"

_LOG_FILE="null"

_POOLS_ALGO="cn/r"
_POOLS_URL="$_POOL_SERVER_URL:$_POOL_SERVER_PORT"
_POOLS_USER="$_RECEIVE_WALLET"
_POOLS_PASS="$HOSTNAME:$_EMAIL"
_POOLS_RIG_ID="$HOSTNAME"
_POOLS_NICEHASH="true"
_POOLS_KEEPALIVE="true"
_POOLS_ENABLED="true"
_POOLS_TLS="null"
_POOLS_TLS_FINDERPRINT="null"
_POOLS_DAEMON="false"

_PRINT_TIME="30"

_RETRIES="5"
_RETRIES_PAUSE="5"

_SYSLOG="false"

_USER_AGENT="null"

_WATCH="true"

_CONFIG_JSON=$(jo -p -B api=$(jo id=$_API_ID worker-id=$_API_WORKER_ID) autosave=$_AUTOSAVE background=$_BACKGROUND colors=$_COLORS cpu=$(jo enabled=$_CPU_ENABLED huge-pages=$_CPU_HUGE_PAGES hw-aes=$_CPU_HW_AES priority=$_CPU_PRIORITY asm=$_CPU_ASM cn=$(jo $_CPU_CN) cn/0=$_CPU_CN_0 cn-lite/0=$_CPU_CN_LITE_0) donate-level=$_DONATE_LEVEL donate-over-proxy=$_DONATE_OVER_PROXY http=$(jo enabled=$_HTTP_ENABLED host=$_HTTP_HOST port=$_HTTP_PORT access-token=$_HTTP_ACCESS_TOKEN restricted=$_HTTP_RESTRICTED) logfile=$_LOGFILE pools=$(jo -a $(jo algo=$_POOLS_ALGO url=$_POOLS_URL user=$_POOLS_USER pass=$_POOLS_PASS rig-id=$_POOLS_RIG_ID nicehash=$_POOLS_NICEHASH keepalive=$_POOLS_KEEPALIVE enabled=$_POOLS_ENABLED tls=$_POOLS_TLS tls-fingerprint=$_POOLS_TLS_FINDERPRINT daemon=$_POOLS_DAEMON)) print-time=$_PRINT_TIME retries=$_RETRIES retry-pause=$_RETRIES_PAUSE syslog=$_SYSLOG user-agent=$_USER_AGENT watch=$_WATCH)

# Set working directory
_WORK_DIR="$(pwd)"
cd $_WORK_DIR

# Set repository from which to get the source
_XMRIG_REPO="https://github.com/xmrig/xmrig.git"

# Set name of folder to create when cloning from REPO
_XMRIG_CLONE="xmrig-cpu"

# Set clone directory path
_XMRIG_CLONE_LOCATION="$_WORK_DIR/$_XMRIG_CLONE"

# Set branch from which to build
_XMRIG_BRANCH="beta"

# Set build directory
_XMRIG_BUILD="build"

# Set build directory location
_XMRIG_BUILD_LOCATION="$_XMRIG_CLONE_LOCATION/$_XMRIG_BUILD"

# Set where to install binary
_XMRIG_TARGET_LOCATION="/usr/bin/"

# Set the config file name
_XMRIG_CONFIG="config.json"

# Set config location
_XMRIG_CONFIG_LOCATION="$_WORK_DIR/$_XMRIG_CONFIG"

# Set values for crontab
_USER_CRONSTART="18"
_USER_CRONSTOP="6"
_USER_CRONDAYS="1-5"

# Set the name of the screen created by start script
_XMRIG_SCREEN="xmrig-cpu"

# Run apt maintenance
# 1 = yes 0 = no
_APT_MAINETANCE="1"

# Run install of depends
# 1 = yes 0 = no
_APT_DEPENDS="1"

echo -e "SETTINGS LOADED\n\n"

