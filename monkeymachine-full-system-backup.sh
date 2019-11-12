#!/bin/bash

LOCALDIR=/
BACKUPDIR=/mnt/backupdrive/monkeymachine
date=`date +"%A %d/%m/%Y at %H:%M"`

USER=jinn

# set env var for dbus to use notify-send
# see http://unix.stackexchange.com/questions/111188/using-notify-send-with-cron
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

# test if backup drive is connected
if [ "`mount | grep backupdrive`" ]; then
    echo "backupdrive available"
else
    echo "mounting backupdrive..."
    mount /mnt/backupdrive
    if [ -e "/mnt/backupdrive/monkeymachine" ]; then
        echo "backupdrive available"
    else
        echo "ERROR: backupdrive not found and cannot mount"
        notify-send --urgency=critical -t 0  "backup from $date failed!"
        exit 1
    fi
fi

# do backup
# (needs root to preserve file ownerships)
sudo rdiff-backup -v5 \
     --exclude "$LOCALDIR/dev" \
     --exclude "$LOCALDIR/proc" \
     --exclude "$LOCALDIR/sys" \
     --exclude "$LOCALDIR/tmp" \
     --exclude "$LOCALDIR/run" \
     --exclude "$LOCALDIR/mnt" \
     --exclude "$LOCALDIR/media" \
     --exclude "$LOCALDIR/var/cache" \
     --exclude "$LOCALDIR/var/tmp" \
     --exclude "$LOCALDIR/lost+found" \
     --exclude "$LOCALDIR/home/jinn/medien" \
     --exclude "$LOCALDIR/home/jinn/torrent" \
     --exclude "$LOCALDIR/home/jinn/tmp" \
     --exclude "$LOCALDIR/home/jinn/.cache" \
     --exclude "$LOCALDIR/home/jinn/.local/share/Trash" \
     --exclude "$LOCALDIR/home/plex" \
     $LOCALDIR $BACKUPDIR
RDIFFRET=$?

# output outcome
if [ "$RDIFFRET" == "0" ]; then
    notify-send --urgency=normal -t 0  "backup from $date was successfull!"
else
    notify-send --urgency=critical -t 0  "backup from $date failed!"
fi

umount /mnt/backupdrive
