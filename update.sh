#!/bin/bash

# Set get xmrig repository and version by sourcing our version file
. settings.sh

# Kill any current xmrig process
. stop.sh

# Get source and build by sourcing our build file
. build.sh

# Clean users contab
crontab -r $USER

# Source our start script to start process again in a screen
. start.sh

echo "####################################"
echo "#    ALL DONE - UPDATE COMPLETE    #"
echo "####################################"

