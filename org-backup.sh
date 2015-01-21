#!/bin/bash

date=`date +%Y%m%d`
backup_folder="$HOME/archive/org-backup/$date"

mkdir $backup_folder
rsync -avz ~/org/* $backup_folder/
