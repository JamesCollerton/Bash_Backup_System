# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh
source ../Configurations/config.sh

function setUpCronJob {

	clear

	newline

	echo "Setting up Cron Job every $numberOfHours hours"

	# Echo new cron into cron file
	echo "* * * * * /Users/JamesCollerton/Documents/Programming/Git_Folders/Bash_Backup_System/Bash_Backup_System/BackUp/backUp.sh" >> myCron
	
	# Install new cron file
	crontab myCron
	rm myCron

	newline

}

function setUpCronJobsMain {

	setUpCronJob

}

setUpCronJobsMain
