#!/bin/bash

if [ "`setxkbmap -print | grep xkb_symbols | grep us`" == "" ]; then
    echo "setting us layout"
    setxkbmap us jinn;
else
    echo "setting german layout"
    setxkbmap de;
fi
