#!/bin/bash

# This script can be run standalone or as part of install.sh

_EMAIL="user@example.com"

_RECEIVE_WALLET="854sqm2Cm4TB2XgPHWqSPSbnFAe3SMzdEDzZHpukQ8NHBPFropbnkFmEKiZPgwjMFC9PTjaFscR2UU6ZwFCqJzGMUiZVbTM"

_POOL_SERVER_URL="192.168.4.5"
_POOL_SERVER_PORT="3333"

#################################
_API_ID="null"
_API_WORKER_ID="$HOSTNAME"

_AUTOSAVE="true"

_BACKGROUND="false"

_COLORS="true"

_CPU_ENABLED="true"
_CPU_HUGE_PAGES="true"
_CPU_HW_AES="null"
_CPU_PRIORITY="null"
_CPU_ASM="true"
_CPU_CN="0 1 2 3"

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

_POOLS_ALGO="cn"
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

_CONFIG_JSON=$(jo -p -B api=$(jo -p id=$_API_ID worker-id=$_API_WORKER_ID) autosave=$_AUTOSAVE background=$_BACKGROUND colors=$_COLORS cpu=$(jo enabled=$_CPU_ENABLED huge-pages=$_CPU_HUGE_PAGES hw-aes=$_CPU_HW_AES priority=$_CPU_PRIORITY asm=$_CPU_ASM cn=$(jo -a $_CPU_CN) cn/0=$_CPU_CN_0 cn-lite/0=$_CPU_CN_LITE_0) donate-level=$_DONATE_LEVEL donate-over-proxy=$_DONATE_OVER_PROXY http=$(jo enabled=$_HTTP_ENABLED host=$_HTTP_HOST port=$_HTTP_PORT access-token=$_HTTP_ACCESS_TOKEN restricted=$_HTTP_RESTRICTED) logfile=$_LOGFILE pools=$(jo -a $(jo algo=$_POOLS_ALGO url=$_POOLS_URL user=$_POOLS_USER pass=$_POOLS_PASS rig-id=$_POOLS_RIG_ID nicehash=$_POOLS_NICEHASH keepalive=$_POOLS_KEEPALIVE enabled=$_POOLS_ENABLED tls=$_POOLS_TLS tls-fingerprint=$_POOLS_TLS_FINDERPRINT daemon=$_POOLS_DAEMON)) print-time=$_PRINT_TIME retries=$_RETRIES retry-pause=$_RETRIES_PAUSE syslog=$_SYSLOG user-agent=$_USER_AGENT watch=$_WATCH)

echo "$_CONFIG_JSON" | tee config.json



