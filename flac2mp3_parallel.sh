#!/bin/bash

parallel --no-notice -j4 ffmpeg -i {} -qscale:a 0 {.}.mp3 ::: *.flac
