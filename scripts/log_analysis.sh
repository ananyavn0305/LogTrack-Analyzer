#!/bin/bash

# LogTrack – Automated Log Analyzer for Amazon Linux 2
REPORT_DIR="/var/log/logtrack"
TODAY=$(date '+%Y-%m-%d')
REPORT="$REPORT_DIR/daily_report_$TODAY.txt"
CRITICAL="$REPORT_DIR/critical_$TODAY.log"

mkdir -p "$REPORT_DIR"
echo "🗒️ LogTrack Report for $TODAY" > "$REPORT"
echo "=============================" >> "$REPORT"

# SSH Failed Logins (Amazon Linux → /var/log/secure)
if [ -f /var/log/secure ]; then
  echo -e "\n🔐 SSH Failed Logins:" >> "$REPORT"
  grep "Failed password" /var/log/secure | tail -n 10 >> "$REPORT"

  echo -e "\n🛡️ Sudo Commands:" >> "$REPORT"
  grep "sudo" /var/log/secure | tail -n 10 >> "$REPORT"
else
  echo -e "\n[!] /var/log/secure not found. Skipping auth logs." >> "$REPORT"
fi

# System Errors
if [ -f /var/log/messages ]; then
  echo -e "\n🚨 System Errors:" >> "$REPORT"
  grep -i "error" /var/log/messages | tail -n 10 >> "$REPORT"
else
  echo -e "\n[!] /var/log/messages not found. Skipping system errors." >> "$REPORT"
fi

# Reboot Events
echo -e "\n🔁 Reboot Events:" >> "$REPORT"
last reboot | head -n 5 >> "$REPORT"

# Disk Usage
echo -e "\n💽 Disk Usage:" >> "$REPORT"
df -h >> "$REPORT"

# Critical Alerts
grep -iE "failed|denied|error|unauthorized|critical" "$REPORT" > "$CRITICAL"

chmod 600 "$REPORT" "$CRITICAL"
