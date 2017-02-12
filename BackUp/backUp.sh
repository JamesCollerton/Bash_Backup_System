# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ../bin/formatting.sh
source ../Configurations/config.sh

# Used to compress the folder we want to back up.
function compressLocationFolder {

	backUpDirectoryNoSlash="${backUpDirectory:1:${#backUpDirectory}}"
	echo "$backUpDirectoryNoSlash"
	tar czf $(date +%Y%m%d-%H%M%S).tar.gz "$backUpDirectoryNoSlash";

}

# Runs main function for backing up
function backUpMain {

	compressLocationFolder

}

# Runs main
backUpMain
