#!/bin/bash

# get primary selection
url=`xclip -out -selection primary`

echo $url

# start in chromium
chromium "google.com/search?hl=de-AT&q=$url"
