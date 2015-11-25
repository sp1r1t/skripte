#!/bin/bash

cd ~/medien/pix/seccam/
date=`date '+%Y%m%d_%H%M%S'`
extension=".jpg"
filename=$date$extension

sudo fswebcam -r 640x480 -set $filename

date=`date +%Y%m%d`

# create todays directory if not present
if ! [ -e "$date" ]; then
    echo "creating directory" $date
    mkdir $date
fi

# move all current files to the archive
sudo mv $date\_* $date

cd -
