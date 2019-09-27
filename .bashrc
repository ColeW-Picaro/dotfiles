#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add scripts folder to path
export PATH="$PATH:$HOME/.scripts"
# Add corruptor to path
export PATH="$PATH:$HOME/Repos/corruptor"
# Add local bin to path
export PATH="$PATH:$HOME/.local/bin"
# Add ruby gems to path
export PATH="$PATH:/home/colew/.gem/ruby/2.6.0/bin"
# Add nullpomino to path
export PATH="$PATH:/home/colew/Nullpomino/NullpoMino/"

export QUTEWAL_DYNAMIC_LOADING=True

# Change default editor to emacs (master race)
export EDITOR="emacs -nw"

# set .bash file locations
export HISTFILE="/home/$USER/.bash/.bash_history" 

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd

# Infinite history.
HISTSIZE= HISTFILESIZE= 

alias ls='ls --color=auto'

# PS1='Sir?: '

# PS1="\[\e[34m\]\u you're in \w:\[\e[m\]"

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\]\u\[$(tput setaf 2)\] in \[$(tput setaf 3)\]\w: \[$(tput sgr0)\]"

export EMACS=true
