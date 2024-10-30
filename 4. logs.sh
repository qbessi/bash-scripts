#!/bin/bash

echo "Log File Rotation"
echo "Move old logs to an archive."
         
LOGS="/var/log"
FOLDER="archive"
TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")

sudo mkdir -p $LOGS/$FOLDER/$TIMESTAMP
sudo find $LOGS -name "*.log" -mtime +7 -type f -exec mv {} $LOGS/$FOLDER \;

echo "Completed"