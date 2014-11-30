#!/bin/bash

# checks tuwel upstate by comparing the down notice index.html to
# the current index.html. if it differs tuwel is up again.
export DISPLAY=:0.0
export XAUTHORITY=/home/spirit/.Xauthority


cd /home/spirit/tmp

if [ -e index.html ]; then
    rm index.html
fi

wget https://tuwel.tuwien.ac.at/ &> /dev/null

indexhtml="`diff index.html reference-index.html`"
#echo $indexhtml

if [ "$indexhtml" != "" ]; then
    echo differs
    sudo -u spirit /usr/bin/notify-send "tuwel up again"
else
    echo same
    sudo -u spirit /usr/bin/notify-send "tuwel still down"
fi

#if [ '`diff index.html reference-index.html`' != '' ]; then echo "something changed"; fi


