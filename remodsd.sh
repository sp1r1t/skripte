#!/bin/bash

echo "removing rts5229"
modprobe rts5229 -r
echo "adding rts5229"
modprobe rts5229
