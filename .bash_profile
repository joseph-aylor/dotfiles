eval "$(rbenv init -)"
x=();for filename in ~/radio/*.pls; do file=${filename/$HOME\/radio\/}; name=${file/.pls}; alias $name="mplayer -playlist $filename"; x=("${x[@]}" $name);done;names=${x[@]};alias radiols="echo $names";

alias be='bundle exec'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
