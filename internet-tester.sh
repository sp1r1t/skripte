#!/bin/bash

# test internet connection
inet=0
if ping -W 3 -c 1 8.8.8.8 &> /dev/null; then
    inet=1
    echo "internet up"
else
    inet=0
    echo "internet down"
    exit
fi

if [ "$1" == "--speedtest" ]; then
    echo "running speedtest"
    cd ~/speedtest
    php speedtest.php
fi

