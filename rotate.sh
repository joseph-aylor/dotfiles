#!/bin/bash
touch ~/.rotate
curr=$(cat ~/.rotate)

case $curr in
    right)
	direction=inverted
	;;
    inverted)
	direction=left
	;;
    left)
	direction=normal
	;;
    *)
	direction=right
	;;
esac
xrandr -o $direction
echo $direction > ~/.rotate
