tmux new-session -ds unix-convert 
tmux send-keys -t unix-convert:1 '~/tools/config/snippets/unix-convert.py $(xclip -o -sel clip)'
tmux send-keys -t unix-convert:1 enter

SESSION_ALREADY_ATTACHED=$(tmux list-sessions | grep unix-convert | grep attached)
if [ ! $SESSION_ALREADY_ATTACHED ]
then
	tmux attach -t unix-convert
fi

# parameterise the session-name and launch, so we can use it for orpie and others

# command for shortcut:
# gnome-terminal -- /home/olly/tools/config/snippets/launch-unix-converter.sh