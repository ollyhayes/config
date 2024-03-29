# export PATH="~/.npm-global/bin:~/.npm-global:~/gems/bin:$PATH"
export PATH="~/.npm-global/bin:$PATH"
export EDITOR=/usr/bin/vim

export FZF_DEFAULT_COMMAND='ag --hidden --ignore node_modules --ignore .git -g ""'
# --ignore .git also checks git ignore if it finds one (I think)
# -g "" means search for that pattern (all files)

#Install Ruby Gems to ~/gems
# export GEM_HOME=$HOME/gems

# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools

source ~/tools/config/.host-specific.sh
