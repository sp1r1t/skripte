#!/bin/bash



cd /tmp
quote=`xclip -out -selection primary`
touch printfile
echo "$quote" > printfile
file="printfile"

scp $file pavianpredator:prints/
#scp $file jinn@pavi-wifi:prints/
ssh pavianpredator "lp prints/$file"
#ssh jinn@pavi-wifi "lp prints/$file"
