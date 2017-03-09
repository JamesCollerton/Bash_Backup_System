# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh

function setUpCronJob {

	newline

	echo "Setting up Cron Job"

	

	newline

}

function setUpCronJobsMain {

	setUpCronJob

}

setUpCronJobsMain
