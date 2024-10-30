#!/bin/bash

echo "Service Status Check"
echo "Checks if a service is running and restarts it if necessary."
echo "Use crontab -e to run this script at a regular interval"

read -p "Email to send alert to: " email_address
read -p "Service to check: " service_name

if ! systemctl is-active --quiet "$service_name"; then 
    echo "$service_name is down, restarting." | mail -s "$service_name is down, restarting." "$email_address"
    systemctl restart "$service_name"
    if systemctl is-active --quiet "$service_name"; then
        echo "$service_name restarted successfully." | mail -s "$service_name restarted successfully." "$email_address"
    else
        echo "Failed to restart $service_name." | mail -s "Failed to restart $service_name." "$email_address"
    fi
else
    echo "$service_name is running"
fi