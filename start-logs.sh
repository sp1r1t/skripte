#!/bin/bash

services=(website-next rkt-service-orchestrator sfdc transaction dblocal-auth server tarifs jabadabatool mg)

for service in "${services[@]}"; do
    innercmd="/home/j.konrath/.nvm/versions/node/v12.16.2/bin/r2de2 logs -s $service"
    outercmd="bash -ic \"$innercmd\"; exec bash"
    echo $outercmd
    xfce4-terminal --title="$service" -e "$outercmd";
done
