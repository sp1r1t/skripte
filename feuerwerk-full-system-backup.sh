#!/bin/bash

DRIVE=feuerwerkbackup
MACHINE=feuerwerk
BACKUPDIR=/mnt/$DRIVE/$MACHINE
date=`date +"%A %d/%m/%Y at %H:%M"`

USER=jinn

# set env var for dbus to use notify-send
# see http://unix.stackexchange.com/questions/111188/using-notify-send-with-cron
if [ -r "$HOME/.dbus/Xdbus" ]; then
  . "$HOME/.dbus/Xdbus"
fi

# test if backup drive is connected
if [ "`mount | grep $DRIVE`" ]; then
    echo "$DRIVE available"
else
    echo "mounting $DRIVE..."
    mount /mnt/$DRIVE
    if [ -e "/mnt/$DRIVE/$MACHINE" ]; then
        echo "$DRIVE available"
    else
        echo "ERROR: $DRIVE not found and cannot mount"
        notify-send --urgency=critical -t 0  "backup from $date failed!"
        exit 1
    fi
fi

# do backup
# (needs root to preserve file ownerships)
sudo rdiff-backup --tempdir /home/$USER/tmp -v5 \
     --exclude-other-filesystems \
     --exclude-special-files \
     --exclude /dev \
     --exclude /proc \
     --exclude /sys \
     --exclude /tmp \
     --exclude /run \
     --exclude /mnt \
     --exclude /media \
     --exclude /var/cache \
     --exclude /var/tmp \
     --exclude /tmp \
     --exclude /lost+found \
     --exclude /home/$USER/medien \
     --exclude /home/$USER/torrent \
     --exclude /home/$USER/Videos \
     --exclude /home/$USER/Downloads \
     --exclude /home/$USER/tmp \
     --exclude /home/$USER/aur \
     --exclude /home/$USER/.cache \
     --exclude /home/$USER/.log \
     --exclude /home/$USER/.thunderbird \
     --exclude /home/$USER/.npm \
     --exclude /home/$USER/.steam \
     --exclude /home/$USER/.PlayOnLinux \
     --exclude /home/$USER/.local/share/Trash \
     --exclude /home/$USER/.local/share/Steam \
     --exclude /home/plex \
     --exclude /**~ \
     --exclude /**node_modules** \
     / $BACKUPDIR
RDIFFRET=$?

# output outcome
if [ "$RDIFFRET" == "0" ]; then
    notify-send --urgency=normal -t 0  "backup from $date was successfull!"
else
    notify-send --urgency=critical -t 0  "backup from $date failed!"
fi

umount /mnt/$DRIVE
