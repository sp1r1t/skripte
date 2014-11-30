#!/bin/bash

cd ~/medien/pix/seccam
list=`ls | sed 's/_.*//' | uniq | grep -v archive`

echo $list[1]
