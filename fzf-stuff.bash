# Key bindings
# ------------
__fzf_select__() {
  local cmd="${FZF_CTRL_T_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type f -print \
    -o -type d -print \
    -o -type l -print 2> /dev/null | cut -b3-"}"
  eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS" fzf -m "$@" | while read -r item; do
    printf '%q ' "$item"
  done
  echo
}

if [[ $- =~ i ]]; then

__fzf_use_tmux__() {
  [ -n "$TMUX_PANE" ] && [ "${FZF_TMUX:-0}" != 0 ] && [ ${LINES:-40} -gt 15 ]
}

__fzfcmd() {
  __fzf_use_tmux__ &&
    echo "fzf-tmux -d${FZF_TMUX_HEIGHT:-40%}" || echo "fzf"
}

__fzf_select_tmux__() {
  local height
  height=${FZF_TMUX_HEIGHT:-40%}
  if [[ $height =~ %$ ]]; then
    height="-p ${height%\%}"
  else
    height="-l $height"
  fi

  tmux split-window $height "cd $(printf %q "$PWD"); FZF_DEFAULT_OPTS=$(printf %q "$FZF_DEFAULT_OPTS") PATH=$(printf %q "$PATH") FZF_CTRL_T_COMMAND=$(printf %q "$FZF_CTRL_T_COMMAND") FZF_CTRL_T_OPTS=$(printf %q "$FZF_CTRL_T_OPTS") bash -c 'source \"${BASH_SOURCE[0]}\"; RESULT=\"\$(__fzf_select__ --no-height)\"; tmux setb -b fzf \"\$RESULT\" \\; pasteb -b fzf -t $TMUX_PANE \\; deleteb -b fzf || tmux send-keys -t $TMUX_PANE \"\$RESULT\"'"
}

fzf-file-widget() {
  if __fzf_use_tmux__; then
    __fzf_select_tmux__
  else
    local selected="$(__fzf_select__)"
    READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
    READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
  fi
}

__fzf_cd__() {
  local cmd dir
  cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  dir=$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m) && printf 'cd %q' "$dir"
}

__fzf_history__() (
  local line
  shopt -u nocaseglob nocasematch
  line=$(
    HISTTIMEFORMAT= history |
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --tac --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd) |
    command grep '^ *[0-9]') &&
    if [[ $- =~ H ]]; then
      sed 's/^ *\([0-9]*\)\** .*/!\1/' <<< "$line"
    else
      sed 's/^ *\([0-9]*\)\** *//' <<< "$line"
    fi
)

# This test for inputrc mode used to be here, but for some reason it didn't work properly
# so I just removed it, I always use vim mode
#if [[ ! -o vi ]]; then

# We'd usually use "\e" to enter vi-movement-mode so we can do our magic,
# but this incurs a very noticeable delay of a half second or so,
# because many other commands start with "\e".
# Instead, we bind an unused key, "\C-x\C-a",
# to also enter vi-movement-mode,
# and then use that thereafter.
# (We imagine that "\C-x\C-a" is relatively unlikely to be in use.)
bind '"\C-x\C-a": vi-movement-mode'

bind '"\C-x\C-e": shell-expand-line'
bind '"\C-x\C-r": redraw-current-line'
bind '"\C-x^": history-expand-line'

# CTRL-T - Paste the selected file path into the command line
# - FIXME: Selected items are attached to the end regardless of cursor position
if [ $BASH_VERSINFO -gt 3 ]; then
bind -x '"\C-t": "fzf-file-widget"'
elif __fzf_use_tmux__; then
bind '"\C-t": "\C-x\C-a$a \C-x\C-addi`__fzf_select_tmux__`\C-x\C-e\C-x\C-a0P$xa"'
else
bind '"\C-t": "\C-x\C-a$a \C-x\C-addi`__fzf_select__`\C-x\C-e\C-x\C-a0Px$a \C-x\C-r\C-x\C-axa "'
fi
bind -m vi-command '"\C-t": "i\C-t"'

# CTRL-R - Paste the selected command from history into the command line
# updated the below two lines for colemak vim bindings (i -> l)
#bind '"\C-r": "\C-x\C-addi`__fzf_history__`\C-x\C-e\C-x\C-r\C-x^\C-x\C-a$a"'
bind '"\C-r": "\C-x\C-addl`__fzf_history__`\C-x\C-e\C-x\C-r\C-x^\C-x\C-a$a"'
#bind -m vi-command '"\C-r": "i\C-r"'
bind -m vi-command '"\C-r": "l\C-r"'

# ALT-C - cd into the selected directory
#bind '"\ec": "\C-x\C-addi`__fzf_cd__`\C-x\C-e\C-x\C-r\C-m"'
bind '"\ec": "\C-x\C-addl`__fzf_cd__`\C-x\C-e\C-x\C-r\C-m"'
#bind -m vi-command '"\ec": "ddi`__fzf_cd__`\C-x\C-e\C-x\C-r\C-m"'
bind -m vi-command '"\ec": "ddl`__fzf_cd__`\C-x\C-e\C-x\C-r\C-m"'

function echo-fzf-selected-local-branch() {
  local branches branch result
  branches=$(git bra) &&

  result=$(echo "$branches" | fzf --ansi -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  branch=$(echo "$result" | sed -E "s/^[ ->]{3}[0-9-]* ([^ ]*).*$/\1/")

  echo $branch
}
function echo-fzf-selected-remote-branch() {
  local branches branch result
  branches=$(git brar) &&

  result=$(echo "$branches" | fzf --ansi -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  branch=$(echo "$result" | sed -E "s/^[ ->]{3}[0-9-]* origin\/([^ ]*).*$/\1/")

  echo $branch
}

function fzf-select-local-branch() {
  local selected="$(echo-fzf-selected-local-branch)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}
function fzf-select-remote-branch() {
  local selected="$(echo-fzf-selected-remote-branch)"
  READLINE_LINE="${READLINE_LINE:0:$READLINE_POINT}$selected${READLINE_LINE:$READLINE_POINT}"
  READLINE_POINT=$(( READLINE_POINT + ${#selected} ))
}

bind -x '"\el": "fzf-select-local-branch"'
bind -x '"\er": "fzf-select-remote-branch"'

fi

# current fzf keys:
# - alt-c change to child directory
# - ctrl-r command from history
# - ctrl-t file widget
# - alt-l git branch - local
# - alt-r git branch - remote
