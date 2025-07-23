#!/bin/bash

# Set log directory
LOG_DIR="/var/log/logtrack"

# Get today's date in YYYY-MM-DD format
TODAY=$(date +%F)

# Input file: Daily full report
INPUT_FILE="$LOG_DIR/daily_report_$TODAY.txt"

# Output file: Critical-only log
OUTPUT_FILE="$LOG_DIR/critical_$TODAY.log"

# Create log directory if it doesn't exist
mkdir -p $LOG_DIR

# Extract critical lines from daily report
grep -iE "failed|denied|error" "$INPUT_FILE" > "$OUTPUT_FILE"
