#!/bin/bash
# This script rebuilds the container for an MP4 video file.

INPUT_FILENAME=$1

if [[ -f "$INPUT_FILENAME" ]]; then
	
	INPUT_FILENAME_NOEXT=`basename $INPUT_FILENAME .mp4`
	
	ffmpeg -i $INPUT_FILENAME -c copy "${INPUT_FILENAME_NOEXT}_temp".mp4
	if [ $? -ne 0 ]; then
		echo "ffmpeg call failed."
		exit
	else
		rm $INPUT_FILENAME
		mv "${INPUT_FILENAME_NOEXT}_temp".mp4 $INPUT_FILENAME
	fi
else
	echo "Input file does not exist."
fi

