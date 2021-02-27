#!/bin/bash

tmux new-session -ds launched-programs

tmux new-window -n volume /home/olly/tools/volume-control/node_modules/.bin/electron /home/olly/tools/volume-control/index
tmux new-window -n audio-switch python3 /home/olly/tools/config/snippets/audio-switch.py

if [ -f "/home/olly/tools/keyboard-presentation-prod/tmux.sh" ]
then
	~/tools/keyboard-presentation-prod/tmux.sh
fi