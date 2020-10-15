#!/bin/bash

for f in ./*.mp4; do
	./reencode-video.sh `basename $f`
done

