# Sources all the files we need. Sets location relative to current
# place.

parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path"

source ./Ignore/credentials.sh
source ../bin/formatting.sh

function sendBackUpFailedEmail {

	newline

	echo "Sending failure email"

	newline

	curl -s --user "api:$mailGunKey" \
    		"$mailGunDomain"  \
    		-F from="$mailGunFrom" \
    		-F to="$mailGunTo" \
    		-F to="$mailGunTo" \
    		-F subject='Back Up Failed' \
    		-F text='Back up system failed to send, please check logs.'

	newline

}

sendBackUpFailedEmail
