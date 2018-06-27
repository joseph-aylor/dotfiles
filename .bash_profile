eval "$(rbenv init -)"
x=();
for filename in ~/radio/*.pls; do
  file=${filename/$HOME\/radio\/};
  name=${file/.pls};
  alias $name="mplayer -playlist $filename";
  x=("${x[@]}" $name);
done;
names=${x[@]};alias radiols="echo $names";

alias be='bundle exec'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC -I rc'
# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
alias subl='reattach-to-user-namespace subl'
export EDITOR='vim'
git config --global core.editor "vim" 

alias bach='mplayer -vo null -shuffle ~/Bach/*'
alias youtube-audio="youtube-dl --extract-audio --audio-format mp3"

function parse_git_branch { 
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
} 

export PS1="\$(parse_git_branch) -  \\$ "
