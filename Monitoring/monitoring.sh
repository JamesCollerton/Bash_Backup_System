# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh
source ../Configurations/config.sh

# Check the size of the back up location
function checkBackUpLocationSize {

	newline

	echo "Current Back Up Location Size"

	newline

	local backUpLocation="$backUpLocation"

	du -sh "$backUpLocation"	

}

# Check how many files have been backed up
function checkNumberOfBackUps {

	newline
	
	echo "Current Number of Backed Up Files"

	newline

	local backUpLocation="$backUpLocation"

	ls -l | wc -l	

}

# Main for the monitoring section
function monitoringMain {

	checkBackUpLocationSize
	checkNumberOfBackUps

}

# Run the main
monitoringMain
