export PATH="~/.npm-global/bin:~/.npm-global:~/gems/bin:$PATH"
export EDITOR=/usr/bin/vim

#Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems

export FZF_DEFAULT_COMMAND='ag --hidden --ignore node_modules --ignore .git -g ""'
# --ignore .git also checks git ignore if it finds one (I think)
# -g "" means search for that pattern (all files)
