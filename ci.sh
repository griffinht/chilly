#!/bin/bash

REMOTE_SYSLOG_SERVER="logserver.example.com"
REMOTE_SYSLOG_PORT="514"
LOG_TAG="bash_script"

# Redirect all stdout and stderr to logger
exec > >(logger -n "$REMOTE_SYSLOG_SERVER" -P "$REMOTE_SYSLOG_PORT" -t "$LOG_TAG" -s) 2>&1

echo "Script started"
date
echo "Processing data..."
# Simulates a long-running process
for i in {1..5}; do
  echo "Processing step $i..."
  sleep 2
done
echo "Script ended"
