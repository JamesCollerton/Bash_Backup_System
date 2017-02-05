#!/bin/bash

# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh

# Used to print the welcome for the back up
function printWelcome {

	clear

	echo "-------------------------------------------"
	echo ""
	echo "Currently installing bash backup"
	echo ""
	echo "-------------------------------------------"

}

# Reads the directories and then writes them to a config file 
function readDirectories {

	newline

	echo "Enter directory to back up."
	read backUpDirectory

	newline

	echo "Enter directory to back up to."
	read backUpLocation

	newline

	rm ../Configurations/config.sh
	touch ../Configurations/config.sh

	if checkDirectoryExists $backUpDirectory; then
		echo "backUpDirectory=$backUpDirectory" >> ../Configurations/config.sh 
		echo "Written back up directory location"
	else
		echo "Directory does not exist."
		exit
	fi

	newline

	if checkDirectoryExists "$backUpLocation"; then
		echo "backUpLocation=$backUpLocation" >> ../Configurations/config.sh
		echo "Written back up location"
	else
		echo "Directory does not exist."
		exit
	fi

	newline

}

# Used to check the directory we're setting actually exists.
function checkDirectoryExists {

	if [ -d "$1" ]; then
		return 0
	else
		return 1
	fi

}

# Main function, prints the welcome and then reads the directories.
function main {

	printWelcome
	readDirectories

}

# Runs main
main

