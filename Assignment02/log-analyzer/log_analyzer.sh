#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 /path/to/logfile"
  exit 1
fi

LOG_FILE="$1"

if [ ! -f "$LOG_FILE" ]; then
  echo "File not found: $LOG_FILE"
  exit 1
fi

NOW=$(date "+%Y-%m-%d_%H%M%S")
HUMAN_NOW=$(date)

FILE_SIZE_BYTES=$(stat -c%s "$LOG_FILE" 2>/dev/null || stat -f%z "$LOG_FILE")
FILE_SIZE_MB=$((FILE_SIZE_BYTES / 1024 / 1024))

ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE")
WARNING_COUNT=$(grep -c "WARNING" "$LOG_FILE")
INFO_COUNT=$(grep -c "INFO" "$LOG_FILE")

TOP_ERRORS=$(grep "ERROR" "$LOG_FILE" | sed -E 's/.*ERROR[[:space:]]*[:-]?[[:space:]]*//' | sort | uniq -c | sort -nr | head -5)

FIRST_ERROR=$(grep "ERROR" "$LOG_FILE" | head -1)
LAST_ERROR=$(grep "ERROR" "$LOG_FILE" | tail -1)

REPORT_FILE="log_analysis_${NOW}.txt"

{
  echo "===== LOG FILE ANALYSIS REPORT ====="
  echo "File: $LOG_FILE"
  echo "Analyzed on: $HUMAN_NOW"
  echo "Size: ${FILE_SIZE_MB}MB ($FILE_SIZE_BYTES bytes)"
  echo
  echo "MESSAGE COUNTS:"
  echo "ERROR: $ERROR_COUNT messages"
  echo "WARNING: $WARNING_COUNT messages"
  echo "INFO: $INFO_COUNT messages"
  echo
  echo "TOP 5 ERROR MESSAGES:"
  echo "$TOP_ERRORS"
  echo
  echo "ERROR TIMELINE:"
  echo "First error: $FIRST_ERROR"
  echo "Last error:  $LAST_ERROR"
  echo
  echo "(Hourly frequency skipped for Git Bash compatibility)"
  echo
  echo "Report saved to: $REPORT_FILE"
} | tee "$REPORT_FILE"
