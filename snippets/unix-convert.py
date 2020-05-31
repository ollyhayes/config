#!/usr/bin/python3

import sys
from datetime import datetime

def try_int(input_value):
	try:
		return int(input_value)
	except ValueError:
		return None

def cyan(message):
	return f'\033[36m{message}\033[0m'

def green(message):
	return f'\033[32m{message}\033[0m'

def print_date(date, type):
	print(f'format: \'{green(type)}\', date: {cyan(date)}')


input_value = sys.argv[1]

input_int = try_int(input_value)
input_type = None
output_date = None

if input_int == None:
	input_type = 'unknown'
	output_date = None
elif input_int > 32503680000: # the year 3000, they lived underwater
	input_type = 'javascript'
	output_date = datetime.utcfromtimestamp(input_int / 1000)
else:
	input_type = 'unix'
	output_date = datetime.utcfromtimestamp(input_int)

print_date(output_date, input_type)

# for binding to keyboard shortcut
# ~/tools/config/snippets/unix-convert.py $(xclip -o -sel clip)
# gnome-terminal -- tmux new-session -ds unix-convert && tmux send-keys -t unix-convert:1 '~/tools/config/snippets/unix-convert.py space $(xclip space -o space -sel space clip) enter' && tmux attach -t unix-convert
# actually, in the end, see launch-unix-converter.sh