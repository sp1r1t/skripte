#!/bin/bash

cd $HOME/medien/pix/seccam/archive
date=`date +%Y%m%d`

# create todays directory if not present
if ! [ -e "$date" ]; then
    echo "creating directory" $date
    mkdir $date
fi



# COMMENT: the sudo should be removed. problem is, the webcam
# script needs root. this is becasue it is run by cron
# but not from user cron. i'm adding the cronjob with a
# script. when trying to do this with less than full
# root permissions the cronjob is not run. idk y.

# move all current files to the archive
sudo mv ../$date* $date

cd -
