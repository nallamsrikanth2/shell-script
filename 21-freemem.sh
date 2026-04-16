#!/bin/bash

# Set threshold (percentage)

THRESHOLD=80

# Get memory usage percentage (without % sign)

USAGE=$(free | awk '/Mem:/ {printf("%.0f"), $3/$2 * 100}')

echo "Current memory usage: $USAGE%"

# Compare with threshold

if [ "$USAGE" -ge "$THRESHOLD" ]; then
echo "⚠️ Memory usage exceeded threshold ($THRESHOLD%)!"
# You can add actions here (kill process, send alert, etc.)
else
echo "✅ Memory usage is under control."
fi
