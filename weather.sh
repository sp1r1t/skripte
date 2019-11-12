#!/bin/bash

curl -s https://darksky.net/48.2,16.3667 > /tmp/page

temp=`cat /tmp/page | grep 'temp swip' | sed 's/.*>\([0-9]\+\).*/\1/'`
desc=`cat /tmp/page | grep 'summary swap' | sed 's/.*>\(.*\)<.*/\1/'`


echo $temp
echo $desc
