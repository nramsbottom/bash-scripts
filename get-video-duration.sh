#!/bin/bash
# This script extracts the length of a given media file and prints it in seconds.

if [[ -f "$1" ]]; then
	ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $1 |  awk -F"." '{print $1}'
	if [ ${PIPESTATUS[0]} -ne 0 ]; then
		echo "ffmpeg call failed."
		exit
	fi
else
	echo "Input file does not exist."
fi
