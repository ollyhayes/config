alias bob="ssh olly.fr.to -p 39404"
alias pi="ssh pi@192.168.0.7"
alias switchCaps="setxkbmap -option caps:swapescape"
alias pc-on="wol 40:8D:5C:4A:1C:B3"
alias pc-on2="wakeonlan 40:8D:5C:4A:1C:B3"
alias pc-vnc="vncviewer 192.168.0.4:5900"
alias mon-lsof="lsof -i TCP -P" # -P numeric port
alias mon-nstat="netstat -atnp" # -t TCP, -n numeric port, -p process names
alias win="cd /mnt/c/Users/ohayes"

if [ -f /usr/share/git/completion/git-prompt.sh ]
then
	source /usr/share/git/completion/git-prompt.sh
fi

# this is used for setting EMAIL for git, so I can switch it and have a different email at work
if ! [ -f ~/tools/config/.host-specific.sh ]
then
	echo "export EMAIL=olly.hayes@gmail.com" > ~/tools/config/.host-specific.sh
fi
source ~/tools/config/.host-specific.sh

if ! type __git_ps1 > /dev/null 2>&1
then
	# if we don't have git-prompt.sh just make up a blank function
	function __git_ps1() {
		echo
	}
fi 

PROMPT_COMMAND=__prompt_command

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
	local nocolor="\[\033[0m\]" # blank

	endColour=$white

	if [ $EXIT != 0 ]; then
		endColour=$red
	fi

	bracketColour="$blue"
	computerColour="$yellow"
	pwdColour="$green"
	gitColour="$cyan"
	pointerColour="$endColour"
	defaultColour="$nocolor"

	if [[ "$TERM" =~ 256color ]]
	then
		bracketColour="\[\033[48;5;0;38;5;027m\]"
		computerColour="\[\033[48;5;0;38;5;208m\]"
		pwdColour="\[\033[48;5;0;38;5;046m\]"
		gitColour="\[\033[48;5;0;38;5;036m\]"
		pointerColour="$endColour"
		defaultColour="$nocolor"
		# \[ start thing
		# \033 escape character (same as \e above?)
		# 48;5;0 set background to 0 (default)
		# 38;5;208 set foreground to 208 (orange)
		# m end thing
	fi

	hostAndWd="$bracketColour[$computerColour\h$pwdColour \w"
	gitFormat=$gitColour'$(__git_ps1 " (%s)")'
	end="$bracketColour]$pointerColour> $defaultColour"

	PS1="$hostAndWd$gitFormat$end"
}

function tmux-dev()
{
	tmux new-session -d
	tmux split-window -h npm run build-watch
	tmux split-window -v npm run run
	tmux select-pane -t 0
	tmux attach-session
}

function tmux-reverse-ssh()
{
	tmux new-session -d
	tmux split-window -h autossh -M 10900 -o "PubkeyAuthentication=yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R \*:9091:localhost:9091 ubuntu@olly.fr.to
	tmux split-window -v autossh -M 10901 -o "PubkeyAuthentication=yes" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R \*:8022:localhost:22 ubuntu@olly.fr.to
	tmux select-pane -t 0
	tmux attach-session
}

function diary()
{
	#vim scp://ubuntu@olly.fr.to//home/ubuntu/Documents/diary.txt
	vim -c ":set wrap" ~/Documents/diary.txt
	scp ~/Documents/diary.txt ubuntu@olly.fr.to:~/Documents/diary/diary.txt
	ssh ubuntu@olly.fr.to /home/ubuntu/Documents/diary/backup.sh
}

#Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH

~/tools/config/snippets/check-repositories.sh
