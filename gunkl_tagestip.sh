#!/bin/bash

tip=`lynx -dump http://www.gunkl.at | sed -n "/Tip des Tages:/,/Weitere Tips \.\.\./p" | grep -v -e 'Weitere Tips' -e 'Tip des Tages' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed '/^$/d'`
echo "$tip"
echo "$tip" > ~/gunkl_tagestip.txt