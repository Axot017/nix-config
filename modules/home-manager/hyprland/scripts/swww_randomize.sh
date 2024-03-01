#!/usr/bin/env bash

if [[ $# -lt 1 ]] || [[ ! -d $1   ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=120
export SWWW_TRANSITION_STEP=1
export SWWW_TRANSITION=any

# This controls (in seconds) when to switch to the next image
INTERVAL=20

while true; do
	find "$1" -type f \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
		done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do
      echo "test"
			swww img "$img"
			sleep $INTERVAL
		done
done
