#!/bin/bash

services=(website-next rkt-service-orchestrator sfdc transaction dblocal-auth server tarifs jabadabatool mg)

# load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm use 12

r2=~/.nvm/versions/node/$(nvm current)/bin/r2de2
echo 'using' $r2

for service in "${services[@]}"; do
    innercmd="$r2 logs -s $service"
    outercmd="bash -ic \"$innercmd\"; exec bash"
    echo $outercmd
    xfce4-terminal --title="$service" -e "$outercmd";
done
