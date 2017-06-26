#!/bin/bash
# Warning, unreadable hack ahoy!
x=();for filename in ~/radio/*.pls; do file=${filename/$HOME\/radio\/}; name=${file/.pls}; alias $name="mplayer -playlist $filename"; x=("${x[@]}" $name);done;names=${x[@]};alias radiols="echo $names";
