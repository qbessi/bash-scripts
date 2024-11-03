#!/bin/bash

echo "Auto Deploy"
echo "Script that deploys application by copying files to a server."

PROJECT="/home/mk"
DEST="/home/server"
SERVERIP="hostname"
USERNAME="username"

while true do;
    if ping -c 1 SERVERDEST; then
        rsync -av $PROJECT $USERNAME@$SERVERIP:$DEST
    else
        echo "Connect Failed: $SERVERIP"
    fi
    sleep 5
done