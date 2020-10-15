#/bin/bash

# Stops screen recording.
# adapted from luke smiths dmenurecord

pidfile=/tmp/screen-record-pid

if [ ! -f "$pidfile" ]; then
        echo "Screen recording pid unavailable."
        exit
fi

pid="$(cat $pidfile)"
rm -f "$pidfile"
kill -s SIGTERM "$pid"
sleep 3
kill -s SIGKILL "$pid" 2>/dev/null

