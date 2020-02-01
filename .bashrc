alias bob="ssh olly@olly.fr.to"
alias amazon="ssh ubuntu@olly.fr.to"
alias pi="ssh pi@192.168.0.9"
alias darron="ssh pi@80.192.66.173"
alias switchCaps="setxkbmap -option caps:swapescape"
alias pc-on="wol 40:8D:5C:4A:1C:B3"
alias pc-on2="wakeonlan 40:8D:5C:4A:1C:B3"
alias pc-vnc="vncviewer 192.168.0.4:5900"
alias mon-lsof="lsof -i TCP -P" # -P numeric port
alias mon-nstat="netstat -atnp" # -t TCP, -n numeric port, -p process names
alias win="cd /mnt/c/Users/ohayes"
export win="/mnt/c/Users/ohayes"
alias killAll='cmd /C "taskkill.exe /F /IM node.exe /T"'
alias copy-passwords='scp /home/olly/Documents/passwords.kdbx olly.fr.to:/mnt/data/root/data/Documents'

function getHostColour()
{
	HOST_COLOUR=$(($(echo $1 | cksum | cut -f 1 -d " ") % 256))

	if [ $HOST_COLOUR -eq 0 ] || [ $HOST_COLOUR -ge 16 ] && [ $HOST_COLOUR -le 19 ] || [ $HOST_COLOUR -ge 232 ] && [ $HOST_COLOUR -le 236 ]
	then
		getHostColour $1"+" # add a plus to retry until we get a valid colour
	fi
}

# this is used for setting EMAIL for git, so I can switch it and have a different email at work
if ! [ -f ~/tools/config/.host-specific.sh ]
then
	echo "export EMAIL=olly.hayes@gmail.com" >> ~/tools/config/.host-specific.sh

	getHostColour $(cat /etc/hostname)
	echo "export HOST_COLOUR=$HOST_COLOUR" >> ~/tools/config/.host-specific.sh
fi
source ~/tools/config/.host-specific.sh

if ! type __git_ps1 > /dev/null 2>&1
then
#	# if we don't have git-prompt.sh just make up a blank function
#	function __git_ps1() {
#		echo
#	}
	source ~/tools/config/snippets/git-prompt.sh
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

	computerColour="$yellow"
	pwdColour="$green"
	gitColour="$cyan"
	pointerColour="$endColour"
	defaultColour="$nocolor"

	if [[ "$TERM" =~ 256color ]]
	then
		computerColour="\[\033[48;5;0;38;5;""$HOST_COLOUR""m\]"
		pwdColour="\[\033[48;5;0;38;5;202m\]" # used to be green 046
		gitColour="\[\033[48;5;0;38;5;036m\]"
		pointerColour="$endColour"
		defaultColour="$nocolor"
		# \[ start thing
		# \033 escape character (same as \e above?)
		# 48;5;0 set background to 0 (default)
		# 38;5;208 set foreground to 208 (orange)
		# m end thing
	fi

	currentDirectory=$(pwd)
	currentDirectoryLength=${#currentDirectory}

	gitPrompt=$(__git_ps1 "(%s)")
	gitPromptLength=${#gitPrompt}

	currentTerminalWidth=$(tput cols)
	promptPartLimit=$((currentTerminalWidth * 6 / 10))

	if [ $((currentDirectoryLength + gitPromptLength)) -lt $promptPartLimit ]
	then
		directoryPart="\w"
		gitPart=$gitPrompt
	else
		directoryPart="…/"$(basename "$currentDirectory")
		gitPart=${gitPrompt/*\//…\/} # replace generator/branch with …/branch
	fi

	#checksum for prompt colouring: $(("$(cksum <<< "test" | cut -f 1 -d ' ')" % 256))

	hostAndWd="$computerColour\h$pwdColour$directoryPart"
	gitFormat=$gitColour"$gitPart"
	end="$pointerColour> $defaultColour"

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

function executeInDirectories()
{
	purple='\033[0;35m'
	none='\033[0m'

	for dir in *
	do
		if [ -d "$dir" ]
		then
			( # () starts a subshell so cd doesn't affect everything
				cd "$dir"
				echo -e ${purple}`pwd`:${none}
				eval $@
			)
		fi
	done
}

function fzo()
{
	vim $(fzf)
}

~/tools/config/snippets/check-repositories.sh
