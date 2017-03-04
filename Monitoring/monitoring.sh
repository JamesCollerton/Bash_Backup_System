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

	echo "$backUpLocationSize"

}

# Check how many files have been backed up
function checkNumberOfBackUps {

	newline
	
	echo "Current Number of Backed Up Files"

	newline

	local backUpLocation="$backUpLocation"
	local numberPredictedBackUps="$backUpCounter"

	local numberBackUps=$( ls -l | wc -l | sed 's/ //g')

	if [ "$numberBackUps" -ne "$numberPredictedBackUps" ] 
		then
			echo "Error"
			exit
	fi	

	echo "Actual number: $numberBackUps"
	echo "Predicted number: $numberPredictedBackUps"

	newline

}

# Main for the monitoring section
function monitoringMain {

	checkBackUpLocationSize
	checkNumberOfBackUps

}

# Run the main
monitoringMain
