#!/bin/bash

echo "Monitor Disk Space"
echo "Monitor disk space and send alert via email."

read -p "Email to send alert to: " email_address
read -p "Set Disk Space to Monitor (e.g., /dev/sda2): " monitor_disk

while true; do

usage=$(df | awk -v disk="$monitor_disk" '$1 == disk {print $5}' | tr -d '%')

if [ "$usage" -ge 0 ] 2>/dev/null; then
    if [ "$usage" -ge 95 ]; then
        echo "Warning: Disk space for $monitor_disk is below 5% free!"
        echo "Sending alert to $email_address..."
        echo "Warning: Disk space for $monitor_disk is below 5% free!" | mail -s "Disk Space Alert" "$email_address"
    else
        echo "Disk space for $monitor_disk is sufficient."
    fi
else
    echo "Error: Unable to retrieve disk usage for $monitor_disk."
fi
    sleep 60
done
