#!/bin/bash

# Threshold in MB
THRESHOLD=10

# Email details
# TO="your_email@example.com"
# SUBJECT="RAM Usage Alert"

# Get used RAM in MB
USED_RAM=$(free -m | awk '/Mem:/ {print $3}')

# Check if used RAM exceeds threshold
if [ "$USED_RAM" -gt "$THRESHOLD" ]; then
    MESSAGE="Warning: RAM usage is ${USED_RAM}MB which is above threshold ${THRESHOLD}MB on $(hostname)"
    
    #echo "$MESSAGE" | mail -s "$SUBJECT" "$TO"
fi