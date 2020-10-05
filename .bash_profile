eval "$(rbenv init -)"

# TODO: Move this out of this file
# TODO: make the variable names not dumb.
x=();
for filename in ~/radio/*.pls; do
  file=${filename/$HOME\/radio\/};
  name=${file/.pls};
  alias $name="mpv --playlist=$filename";
  x=("${x[@]}" $name);
done;
names=${x[@]};alias radiols="echo $names";

alias be='bundle exec'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
# ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
alias subl='reattach-to-user-namespace subl'

# Been using Jetbrains products lately.
# Going from them to vim is quite jarring.
# No I'm not going to use a vim plugin.
export EDITOR='vim'
git config --global core.editor "vim"

export PAGER='less'

alias bach='mplayer -vo null -shuffle ~/Bach/*'
alias art-bell-collection='mplayer -vo null -shuffle ~/joedrive/shows/*'
alias lofi='mplayer -vo null -shuffle ~/joedrive/Music/lofi/**/*'
alias future-funk='mplayer -vo null -shuffle ~/joedrive/Music/future_funk/**/*'
alias youtube-audio="youtube-dl --extract-audio --audio-format mp3"
alias wiki="vim -c VimwikiIndex"

# Let's not use ancient python
alias python='python3'
alias pip='pip3'

function parse_git_branch { 
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/' 
} 

export PS1="\$(parse_git_branch) -  \\$ "
