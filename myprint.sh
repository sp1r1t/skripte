#!/bin/bash

file=$1

#rsync -avz $1 jinn@pavi-wifi:prints/
rsync -avz $1 jinn@pavianpredator:prints/
#ssh jinn@pavi-wifi "lp prints/$1"
ssh jinn@pavianpredator "lp prints/$1"
