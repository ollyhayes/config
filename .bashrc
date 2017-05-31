alias bob="ssh olly.fr.to -p 39404"
alias pi="ssh pi@192.168.0.7"
alias switchCaps="setxkbmap -option caps:swapescape"
alias pc-on="wol 40:8D:5C:4A:1C:B3"
alias pc-on2="wakeonlan 40:8D:5C:4A:1C:B3"
alias pc-vnc="vncviewer 192.168.0.4:5900"

export EDITOR=vim

if [ -f /usr/share/git/completion/git-prompt.sh ]
	then
	source /usr/share/git/completion/git-prompt.sh
fi


export PROMPT_COMMAND=__prompt_command
export PATH=~/.npm-global/bin:$PATH

function __prompt_command() {
	local EXIT="$?"
	PS1=""

	local darkblack='\[\e[0;30m\]' # Black - Regular
	local darkred='\[\e[0;31m\]' # Red
	local darkgreen='\[\e[0;32m\]' # Green
	local darkyellow='\[\e[0;33m\]' # Yellow
	local darkblue='\[\e[0;34m\]' # Blue
	local darkpurple='\[\e[0;35m\]' # Purple
	local darkcyan='\[\e[0;36m\]' # Cyan
	local darkwhite='\[\e[0;37m\]' # White
	local black='\[\e[1;30m\]' # Black - Bold
	local red='\[\e[1;31m\]' # Red
	local green='\[\e[1;32m\]' # Green
	local yellow='\[\e[1;33m\]' # Yellow
	local blue='\[\e[1;34m\]' # Blue
	local purple='\[\e[1;35m\]' # Purple
	local cyan='\[\e[1;36m\]' # Cyan
	local white='\[\e[1;37m\]' # White

	endColour=$white

	if [ $EXIT != 0 ]; then
		endColour=$red
	fi

	hostAndWd="$blue[$yellow\h$green \w"
	gitFormat=$cyan'$(__git_ps1 " (%s)")'
	end="$blue]$endColour> $white"

	export PS1="${hostAndWd}${gitFormat}${end}"
}
