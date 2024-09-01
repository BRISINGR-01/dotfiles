#!/bin/bash

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=normal "Command has finished"'

alias macos="cd ~/programs/macOS-Simple-KVM/ && ./basic.sh"
alias cls="clear"
alias coder="code -r"

alias yt="yt-dlp -x --audio-format mp3 -P ~/Desktop/Alex/Music/"

alias opent="gnome-terminal"

alias n='n -e'
alias f='fuck'

alias antlr4='java -jar /home/alex/Documents/antlr-4.13.1-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

