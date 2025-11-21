#!/usr/bin/env bash

LOG_DATE=$(date '+%Y-%m-%d %H:%M:%S')

UPTIME=$(uptime -p)

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

TOP_PROCESSES=$(ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 4)

echo "===== System Report: $LOG_DATE ====="
echo "Uptime: $UPTIME"
echo "CPU Usage: ${CPU_USAGE}%"
echo "Memory Usage: ${MEMORY_USAGE}%"
echo "Disk Usage (/): ${DISK_USAGE}"
echo "Top 3 processes by CPU:"
echo "$TOP_PROCESSES"
echo
