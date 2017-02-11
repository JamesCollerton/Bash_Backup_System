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

# Used to read how often we want to take a backup. 
function readTimings {
	
	newline

	echo "How often would you like to take a back up (hours)."
	read numberOfHours
	
	newline

	if parseInteger "$numberOfHours" ; then
		echo "numberOfHours=$numberOfHours" >> ../Configurations/config.sh
		echo "Written number of hours"
	else
		echo "Number of hours is not an integer"
		exit
	fi

}

function parseInteger {

	local integerInput=$1
	echo "$integerInput"

	local integerRegEx='^[0-9]+$'
	if ! [[ "$integerInput" =~ $integerRegEx ]] ; then
		return 1
	else
		return 0
	fi

}

# Main function, prints the welcome and then reads the directories.
function main {

	printWelcome
	readDirectories
	readTimings

}

# Runs main
main

