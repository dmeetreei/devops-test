#!/bin/bash

LOG="/var/log/monitoring.log"
PIDFILE="/var/run/test-monitor.pid"

PID_NOW=$(pgrep -x test)

if [ -z "$PID_NOW" ]; then
    exit 0
fi

PID_OLD=""
[ -f "$PIDFILE" ] && PID_OLD=$(cat "$PIDFILE")

if [ "$PID_NOW" != "$PID_OLD" ]; then
    echo "$(date '+%F %T')  Process test restarted (PID $PID_NOW)" >> "$LOG"
    echo "$PID_NOW" > "$PIDFILE"
fi

curl -sSf https://test.com/monitoring/test/api -o /dev/null
if [ $? -ne 0 ]; then
    echo "$(date '+%F %T')  Сервер мониторинга недоступен" >> "$LOG"
fi
