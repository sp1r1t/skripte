#!/bin/bash

LOGDIR=~/.log/mail
if [[ -f $LOGDIR ]]; then
    echo "$LOGDIR exists"
else
    echo "$LOGDIR doesn't exist"
    mkdir $LOGDIR
fi

echo "Running update_mail $(date)"

offlineimap >$LOGDIR/offlineimap.$(date +%Y-%m-%d-%H-%M) 2>&1
notmuch new >$LOGDIR/notmuch.$(date +%Y-%m-%d-%H-%M) 2>&1
