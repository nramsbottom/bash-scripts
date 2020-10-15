#/bin/bash
# Starts recording screen at 2560x1440 @ 25fps into the home directory

pidfile=/tmp/screen-record-pid

if [ -f "$pidfile" ]; then
	echo "Screen recording already in progress. Aborting."
	exit
fi

ffmpeg -y -f x11grab -video_size 2560x1440 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac "$HOME/$(date +%Y-%m-%d_%H%M%S)".mp4 & echo $! > "$pidfile"
