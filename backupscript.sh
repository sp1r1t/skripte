#!/bin/bash

#LOCALDIR=$HOME
LOCALDIR=$HOME/medien/pix
#REMOTEHOST=pi@jinn.at
REMOTEHOST=pi@192.168.66.70
BACKUPDIR=/media/exthd/backup_test

rdiff-backup -v5 --exclude "$LOCALDIR/.*" $LOCALDIR $REMOTEHOST::$BACKUPDIR

#TODO: include important config files
