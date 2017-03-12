# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh
source ../bin/monitoring.sh
source ../Configurations/config.sh

# Check the size of the back up location
function checkBackUpLocationSize {

	newline

	echo "Current Back Up Location Size"

	newline

	local backUpLocation="$backUpLocation"

	backUpLocationSize=$(du -sh "$backUpLocation" | sed 's/[^0-9]//g')

	if [ "$backUpLocationSize" -eq 0 ]
		then
			echo "Back up location empty"
			exit
	fi

	echo "Current back up location size: $backUpLocationSize"

}

# Check how many files have been backed up
function checkNumberOfBackUps {

	newline
	
	echo "Current Number of Backed Up Files"

	newline

	local backUpLocation="$backUpLocation"
	local numberPredictedBackUps="$backUpCounter"

	local numberBackUps=$( ls -l "$backUpLocation"  | wc -l | sed 's/ //g')
	numberBackUps=$(($numberBackUps-1))
	
	if [ "$numberBackUps" -ne "$numberPredictedBackUps" ] 
		then
			echo "Incorrect number of backups made."
			exit
	fi	

	echo "Correct number of backups made: $numberBackUps"

	newline

}

# Main for the monitoring section
function monitoringMain {

	checkBackUpLocationSize
	checkNumberOfBackUps

}

# Run the main
monitoringMain
