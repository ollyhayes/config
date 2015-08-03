alias bob="ssh olly.fr.to -p 39404"
alias switchCaps="setxkbmap -option caps:swapescape"

export EDITOR=vim

source /usr/share/git/completion/git-prompt.sh

darkblack='\[\e[0;30m\]' # Black - Regular
darkred='\[\e[0;31m\]' # Red
darkgreen='\[\e[0;32m\]' # Green
darkyellow='\[\e[0;33m\]' # Yellow
darkblue='\[\e[0;34m\]' # Blue
darkpurple='\[\e[0;35m\]' # Purple
darkcyan='\[\e[0;36m\]' # Cyan
darkwhite='\[\e[0;37m\]' # White
black='\[\e[1;30m\]' # Black - Bold
red='\[\e[1;31m\]' # Red
green='\[\e[1;32m\]' # Green
yellow='\[\e[1;33m\]' # Yellow
blue='\[\e[1;34m\]' # Blue
purple='\[\e[1;35m\]' # Purple
cyan='\[\e[1;36m\]' # Cyan
white='\[\e[1;37m\]' # White

hostAndWd="$blue[$yellow\h$green \w"
gitFormat=$cyan'$(__git_ps1 " (%s)")'
end="$blue]$white> "

export PS1="${hostAndWd}${gitFormat}${end}"
