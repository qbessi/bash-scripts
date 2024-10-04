#!/bin/bash

echo " __ )     \      ___|  |  /  |   |   _ \ "
echo " __ \    _ \    |      ' /   |   |  |   | "
echo " |   |  ___ \   |      . \   |   |  ___/ "
echo "____/ _/    _\ \____| _|\_\ \___/  _|    "

# color codes
RED='\033[0;31m'
YELLOW='\033[1;33m'
RESET='\033[0m'  # Reset to default color

# source and backup directories
echo ""
echo "Please enter the source directory (local):"
read SOURCE_DIR

echo ""
echo "Please enter the backup directory (local or remote):"
read BACKUP_DIR

echo ""
echo "Please enter how often to backup (seconds):"
read TIMER

mkdir -p $BACKUP_DIR

trap "echo -e '${RED} ABORTED: BACKUP $SOURCE_DIR${RESET}'; exit" SIGINT

while true; do
    TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")
    BACKUP_NAME="backup_$TIMESTAMP"
    
    echo -e "${YELLOW}IN PROGRESS: BACKUP $SOURCE_DIR${RESET}"

    rsync -avz --delete "$SOURCE_DIR/" "$BACKUP_DIR/$BACKUP_NAME/"

    if [ $? -eq 0 ]; then
        echo "Backup of $SOURCE_DIR completed successfully at $BACKUP_DIR/$BACKUP_NAME."
    else
        echo "Backup failed."
    fi

    sleep $TIMER
done
