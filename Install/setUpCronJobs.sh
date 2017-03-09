# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh

function setUpCronJob {

	echo "Setting up Cron Job"

}

function setUpCronJobsMain {

	setUpCronJob

}

setUpCronJobsMain
