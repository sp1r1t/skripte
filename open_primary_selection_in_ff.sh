#!/bin/bash

# get primary selection
url=`xclip -out -selection primary`

echo $url

# start in chromium
firefox "https://duckduckgo.com/?q=$url"
