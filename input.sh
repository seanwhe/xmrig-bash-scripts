#!/bin/bash

# Ask user questions
# Capture input

echo -e "${_YELLOW}Opt for default settings or enter your own.\n"

echo -e "No - values taken from 'settings.sh'."
echo -e "Yes - values taken from 'mysettings.sh' (recomended).\n"

echo -e "When 'mysettings.sh' they are given preference at installation and on subsequence restarts."
echo -e "Own settings is recomended to avoid your settings being overidden in upgrades.${_RESET}\n"

if [ -f $_WORK_DIR/$_MYSETTINGS_FILE ]; then

	# Call function
	show_mysettings

else

	prompt_confirm "Enter your own settings?" 

	if [ "$?" -eq 0 ]; then

		# Create a file

		touch $_MYSETTINGS_FILE_LOCATION 
		chmod +x $_MYSETTINGS_FILE_LOCATION
		echo "#!/bin/bash" > $_MYSETTINGS_FILE_LOCATION

		# Prompt user input

		echo "Current pool URL: $_POOL_SERVER_URL"
		read -p "Enter new pool URL: " _POOL_SERVER_URL

		echo "Current pool TCP Port: $_POOL_SERVER_PORT"
		read -p "Enter new pool TCP Port: " _POOL_SERVER_PORT

		echo "Current Receive Wallet address: $_RECEIVE_WALLET"
		read -p "Enter new Receive Wallet address: " _RECEIVE_WALLET

		echo "Current email address: $_EMAIL"
		read -p "Enter new email address: " _EMAIL

		echo "Current Miner Identifier: $_API_WORKER_ID"
		read -p "Enter Miner Identifier: " _API_WORKER_ID

		# Write user input to file

		echo "_POOL_SERVER_URL=\"$_POOL_SERVER_URL\"" >> $_MYSETTINGS_FILE_LOCATION
		echo "_POOL_SERVER_PORT=\"$_POOL_SERVER_PORT\"" >> $_MYSETTINGS_FILE_LOCATION
		echo "_RECEIVE_WALLET=\"$_RECEIVE_WALLET\"" >> $_MYSETTINGS_FILE_LOCATION
		echo "_EMAIL=\"$_EMAIL\"" >> $_MYSETTINGS_FILE_LOCATION
		echo "_API_WORKER_ID=\"$_API_WORKER_ID\"" >> $_MYSETTINGS_FILE_LOCATION

	fi

fi

echo -e "${_GREEN}MYSETTINGS LOADED${_RESET}"
