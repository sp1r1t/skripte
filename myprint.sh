#!/bin/bash

file=$1

#scp $1 pavianpredator:prints/
rsync -avz $1 jinn@pavi-wifi:prints/
#ssh pavianpredator "lp prints/$1"
ssh jinn@pavi-wifi "lp prints/$1"
