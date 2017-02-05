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

	exists=$(checkDirectoryExists "$backUpDirectory")

	echo "Exists: $exists"
	
	if [ "$exists" ]; then
		echo "backUpDirectory=$backUpDirectory" >> ../Configurations/config.sh 
		echo "Written back up directory location"
	else
		echo "Directory does not exist."
		exit
	fi

	newline
	
	exists=$(checkDirectoryExists "$backUpDirectory")

	echo "Exists: $exists"
	
	echo "backLocation=$backUpLocation" >> ../Configurations/config.sh
	echo "Written back up location"

	newline

}

# Used to check the directory we're setting actually exists.
function checkDirectoryExists {

	local directory="$arg1"

	if [ -d "$directory" ]; then
		echo "1"
		return
	fi

	echo "0"

}

# Main function, prints the welcome and then reads the directories.
function main {

	printWelcome
	readDirectories

}

# Runs main
main

