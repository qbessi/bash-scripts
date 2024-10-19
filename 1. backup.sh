#!/bin/bash

echo " __ )     \      ___|  |  /  |   |   _ \ "
echo " __ \    _ \    |      ' /   |   |  |   | "
echo " |   |  ___ \   |      . \   |   |  ___/ "
echo "____/ _/    _\ \____| _|\_\ \___/  _|    "

RED='\033[0;31m'         # Red color for error messages
YELLOW='\033[1;33m'      # Yellow color for progress messages
RESET='\033[0m'          # Reset to default color after coloring text

echo ""
echo "Please enter the source directory (local):"
read SOURCE_DIR         # Read user input for the source directory

echo ""
echo "Please enter the backup directory (local or remote):"
read BACKUP_DIR         # Read user input for the backup directory

# Prompt the user for the backup frequency
echo ""
echo "Please enter how often to backup (seconds):"
read TIMER              # Read user input for the backup interval in seconds

# Create the backup directory if it doesn't already exist
mkdir -p "$BACKUP_DIR"

# Set a trap to handle script interruption (Ctrl+C)
trap "echo -e '${RED} ABORTED: BACKUP $SOURCE_DIR${RESET}'; exit" SIGINT

# Infinite loop to perform backups
while true; do
    # Get the current timestamp for naming the backup folder
    TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")
    BACKUP_NAME="backup_$TIMESTAMP"  # Name the backup folder with the timestamp
    
    # Notify user that the backup is in progress
    echo -e "${YELLOW}IN PROGRESS: BACKUP $SOURCE_DIR${RESET}"

    # Perform the backup using rsync
    rsync -avz --delete "$SOURCE_DIR/" "$BACKUP_DIR/$BACKUP_NAME/"

    # Check if the rsync command was successful
    if [ $? -eq 0 ]; then
        # Notify user of successful backup
        echo "Backup of $SOURCE_DIR completed successfully at $BACKUP_DIR/$BACKUP_NAME."
    else
        # Notify user of failed backup
        echo "Backup failed."
    fi

    # Wait for the specified TIMER duration before the next backup
    sleep $TIMER
done