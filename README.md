# Bash Backup System 

This is a small system written in Bash for backing up a given folder. The idea was to teach myself some bash and to get used to VIM.

It's set up using the install.sh script, which asks for:

* A directory to back up.
* A location to back up to.
* How regularly (in hours) you want to back up.

It then sets up a cron job in the background to compress and move your back up folder to your back up location. If the back up fails then it emails you to say so using the MailGun client.
