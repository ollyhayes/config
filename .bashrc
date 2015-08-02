alias bob="ssh olly.fr.to -p 39404"
alias switchCaps="setxkbmap -option caps:swapescape"

export EDITOR=vim

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="\[$(tput bold)\]\[$(tput setaf 4)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\] \W\[$(tput setaf 4)\]]\[$(tput setaf 7)\]> \[$(tput sgr0)\]"
