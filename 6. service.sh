#!/bin/bash

echo "Service Status Check"
echo "Checks if a service is running and restarts it if necessary."

SERVICE_NAME="$1"
EMAIL_ADDRESS="$2"
LOGFILE="/var/log/service_check.log"

send_email() {
    local subject="$1"
    local message="$2"
    echo "$message" | mail -s "$subject" "$EMAIL_ADDRESS"
}

check_service() {
    systemctl is-active --quiet "$SERVICE_NAME"
}

restart_service() {
    systemctl restart "$SERVICE_NAME"
}

echo "Starting service check for $SERVICE_NAME" | tee -a "$LOGFILE"

if ! check_service; then
    echo "$(date): $SERVICE_NAME is down, attempting to restart..." | tee -a "$LOGFILE"
    send_email "$SERVICE_NAME is down, attempting restart" "$SERVICE_NAME is not running. Restarting the service."

    restart_service
    if check_service; then
        echo "$(date): $SERVICE_NAME restarted successfully." | tee -a "$LOGFILE"
        send_email "$SERVICE_NAME restarted successfully" "$SERVICE_NAME has been restarted successfully."
    else
        echo "$(date): Failed to restart $SERVICE_NAME." | tee -a "$LOGFILE"
        send_email "Failed to restart $SERVICE_NAME" "Attempt to restart $SERVICE_NAME failed. Manual intervention may be required."
    fi
else
    echo "$(date): $SERVICE_NAME is running normally." | tee -a "$LOGFILE"
fi
