#!/bin/bash
touch ~/.rotate
curr=$(cat ~/.rotate)

case $curr in
    right)
	xrandr -o inverted
	echo inverted > ~/.rotate
	;;
    inverted)
	xrandr -o left
	echo left > ~/.rotate
	;;
    left)
	xrandr -o normal
	echo normal > ~/.rotate
	;;
    *)
	xrandr -o right
	echo right > ~/.rotate
	;;
 esac
