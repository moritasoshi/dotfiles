#!/bin/bash

LOG_FILE=./for.log

while true; do
  # execute command async
  echo "hello" >>$LOG_FILE 2>&1 &

  echo "" >>$LOG_FILE
  sleep 60
done
