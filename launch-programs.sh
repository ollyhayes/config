#!/bin/bash

tmux new-session -ds launched-programs

tmux new-window -n volume /home/olly/tools/volume-control/node_modules/.bin/electron /home/olly/tools/volume-control/index
tmux new-window -n audio-switch python3 /home/olly/tools/config/snippets/audio-switch.py
tmux new-window -n status-bot node /home/olly/tools/config/snippets/status-bot.js

if [ -f "/home/olly/tools/keyboard-presentation/tmux.sh" ]
then
	~/tools/keyboard-presentation/tmux.sh
fi


# on pc and work laptop, launch here
# on bob, launch from thermostat?
# on pi, load with tmux
# on darron,