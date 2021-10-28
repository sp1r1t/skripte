#!/bin/bash

DRIVE=feuerwerkbackup
MACHINE=feuerwerk
BACKUPSERVER=7bit.at
SERVERUSER=bu
date=`date +"%A %d/%m/%Y at %H:%M"`

USER=jinn

# set env var for dbus to use notify-send
# see http://unix.stackexchange.com/questions/111188/using-notify-send-with-cron
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

# test if server is up
if [ "`rdiff-backup --test-server bu@7bit.at::/ignored`" ]; then
    echo "$BACKUPSERVER available"
else
    echo "ERROR: $BACKUPSERVER not available and cannot connect"
    notify-send --urgency=critical -t 0  "backup from $date failed!"
    exit 1
fi

# do backup
# (rdiff-backup needs root to preserve file ownerships,
#  but we don't care about it on remote)
rdiff-backup --tempdir /home/$USER/tmp -v5 \
             --include "/home/$USER/**/7bit/**" \
             --include "/home/$USER/.ssh" \
             --include "/home/$USER/Dropbox" \
             --exclude '**' \
             /home/$USER/ $SERVERUSER@$BACKUPSERVER::backup/
RDIFFRET=$?

# output outcome
if [ "$RDIFFRET" == "0" ]; then
    notify-send --urgency=normal -t 0  "backup to $BACKUPSERVER from $date was successfull!"
else
    notify-send --urgency=critical -t 0  "backup from $date failed!"
fi


