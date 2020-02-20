# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/histfile
HISTSIZE=1000
SAVEHIST=1000


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

alias "emacs"="emacs -nw"

# Class directory Aliases
alias parallel='cd ~/Documents/CS476/'
alias os='cd ~/Documents/CS380/'
alias software='cd ~/Documents/CS420/'


EDITOR="emacs -nw"


bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/colew/.zshrc'

autoload -Uz promptinit
promptinit

autoload -Uz compinit
compinit
# End of lines added by compinstall

prompt fire
setopt autocd



# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
