#!/bin/bash
# disk_monitor.sh — warns if root disk usage exceeds a threshold

THRESHOLD=80  # percent — change to 1 to force-trigger for testing

USAGE=$(df -h / | tail -1 | awk '{print $5}' | tr -d '%')
# tr -d '%' strips the % sign so we can compare it as a number

if [ "$USAGE" -gt "$THRESHOLD" ]; then
  echo "WARNING: Disk usage is at ${USAGE}%, exceeds threshold of ${THRESHOLD}%"
else
  echo "OK: Disk usage is at ${USAGE}%"
fi
