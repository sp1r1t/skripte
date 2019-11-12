#!/bin/bash

LOCALDIR=$HOME
USER=pi

# test if locally connected to pi
if ping -W 3 -c 1 192.168.66.70 &> /dev/null; then
    REMOTEHOST=$USER@192.168.66.70
else
    REMOTEHOST=$USER@jinn.at
fi

BACKUPDIR=/media/exthd/remote-backup

rdiff-backup -v5 \
             --exclude "**.git" \
             --include "$LOCALDIR/.bashrc" \
             --include "$LOCALDIR/.bin" \
             --include "$LOCALDIR/.config/awesome" \
             --include "$LOCALDIR/.config/conky" \
             --include "$LOCALDIR/.config/filezilla" \
             --include "$LOCALDIR/.emacs" \
             --exclude "$LOCALDIR/.emacs.d/auto-save-list" \
             --include "$LOCALDIR/.emacs.d" \
             --include "$LOCALDIR/.mcabberrc" \
             --include "$LOCALDIR/.offlineimaprc" \
             --include "$LOCALDIR/.rtorrent.rc" \
             --include "$LOCALDIR/.ssh" \
             --include "$LOCALDIR/.Xauthority" \
             --include "$LOCALDIR/.xinitrc" \
             --include "$LOCALDIR/.Xresources" \
             --include "$LOCALDIR/.zshrc" \
             --exclude "$LOCALDIR/.*" \
             --include "$LOCALDIR/.zshrc" \
             --include "$LOCALDIR/archive" \
             --include "$LOCALDIR/buero" \
             --include "$LOCALDIR/hacks" \
             --include "$LOCALDIR/leben" \
             --include "$LOCALDIR/org" \
             --include "$LOCALDIR/medien/pix" \
             --include "$LOCALDIR/rezepte" \
             --include "$LOCALDIR/vars" \
             --exclude "$LOCALDIR/*" \
             $LOCALDIR $REMOTEHOST::$BACKUPDIR

#TODO: include important config files
