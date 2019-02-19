function startTest()
{
	# to be run inside tmux
	tmux new-window -c "[directory]" "[command for server]" # launch test server
	tmux split-window -c "[directory]" # open a split
	tmux resize-pane -t 0 -y 5 # set test server window small
	tmux send-keys "[command to launch tests]" # get tests ready
}
