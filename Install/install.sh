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

	echo "backUpDirectory=$backUpDirectory" >> Configurations/config.sh 
	echo "Written back up directory location"

	newline

	echo "backLocation=$backUpLocation" >> Configurations/config.sh
	echo "Written back up location"

	newline

}

# Main function, prints the welcome and then reads the directories.
function main {

	printWelcome
	readDirectories

}

# Runs main
main

