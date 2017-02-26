# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh
source ../Configurations/config.sh

# Check the size of the back up location
function checkBackUpLocationSize {
	
}

# Check how many files have been backed up
function checkNumberOfBackUps {

}

# Main for the monitoring section
function monitoringMain {

}

# Run the main
monitoringMain
