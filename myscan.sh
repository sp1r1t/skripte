#!/bin/bash

ssh pavianpredator "sudo  scanimage -d 'hpaio:/usb/Deskjet_2050_J510_series?serial=CN07V293BZ05D1' --format=tiff --resolution=100 > $1.tiff"

scp pavianpredator:$1.tiff .
