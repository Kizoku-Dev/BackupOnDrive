#!/bin/sh

# This line is here to grant access to your drive binary in the bin go folder (if you have "drive : command not found error")
# If you don't need comment, otherwise put your path
PATH=/usr/local/go/bin/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games

# SOME INFORMATIONS
SITENAME="website_name"
DBNAME="db_name"
DBUSER="put_your_db_username_here"
DBPW="put_your_db_password_here"

# GET THE DATE \0/
THEDATE=`date +%d%m%y%H%M`

# START SAVE & ZIP
# backup your database and gzip
mysqldump -u $DBUSER -p${DBPW} $DBNAME | gzip > /path/to/your/local/drive/folder/dbbackup_${DBNAME}_${DATE}.bak.gz

zip -r /path/to/your/local/drive/folder/sitebackup_${SITENAME}_${DATE} /path/to/the/files/you/want/to/backup/$SITENAME/www
# END

# the "yes" command on the following command lines is here to bypass user interaction on the "drive" command
# PUSH ON YOUR DRIVE
yes | drive push /path/to/your/local/drive/folder

# TRASH FILES OLDER THAN 5 DAYS
yes | find /path/to/your/local/drive/folder/site* -mtime +5 -exec drive trash {} \;
yes | find /path/to/your/local/drive/folder/db* -mtime +5 -exec drive trash {} \;

# PULL FROM YOUR DRIVE
yes | drive pull /path/to/your/local/drive/folder/
