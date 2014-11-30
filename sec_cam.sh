#!/bin/bash

cd ~/medien/pix/seccam/
date=`date '+%Y%m%d_%H%M%S'`
extension=".jpg"
filename=$date$extension

sudo fswebcam -r 640x480 -set $filename

cd -
